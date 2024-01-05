package com.kt.aisuite.metrics.service

import com.kt.aisuite.metrics.model.Pod
import com.kt.aisuite.metrics.model.PrometheusResponse
import com.kt.aisuite.metrics.model.Pvc
import org.springframework.http.MediaType
import org.springframework.stereotype.Service
import org.springframework.web.reactive.function.BodyInserters
import org.springframework.web.reactive.function.client.WebClient
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono
import java.util.*

/**
 * MetricsService 클래스는 프로메테우스 API를 활용하여 Kubernetes 클러스터 내의 파드 및 PVC 관련 메트릭스를 조회합니다.
 * 이 클래스는 웹 클라이언트를 통해 프로메테우스 API에 쿼리를 보내고, 반환된 데이터를 기반으로 다양한 메트릭스 정보를 제공합니다.
 *
 * 주요 기능으로는 파드 별 CPU 및 메모리 사용량 조회, 파드에 연결된 PVC의 할당량 및 사용량 조회 등이 있으며,
 * 이를 통해 Kubernetes 클러스터의 리소스 사용 현황을 모니터링하고 분석하는 데 활용됩니다.
 *
 * 이 서비스는 Spring Framework의 WebClient를 사용하여 비동기적으로 API 요청을 처리하며,
 * Reactor 라이브러리의 Mono 및 Flux 타입을 활용하여 비동기 처리를 수행합니다.
 *
 * @property webClient WebClient 인스턴스로, 프로메테우스 API와의 통신에 사용됩니다.
 */
@Service
class MetricsService(private val webClient: WebClient) {

	/**
	 * 주어진 쿼리를 사용하여 프로메테우스 API로부터 메트릭 데이터를 조회합니다.
	 *
	 * @param query 프로메테우스 API에 전송될 쿼리 문자열입니다.
	 * @return 프로메테우스로부터의 응답을 포함하는 `PrometheusResponse`의 `Mono` 객체를 반환합니다.
	 */
	private fun fetchMetrics(query: String): Mono<PrometheusResponse> {
		val formData = BodyInserters.fromFormData("query", query)
		return webClient.post()
			.uri("/api/v1/query")
			.contentType(MediaType.APPLICATION_FORM_URLENCODED)
			.body(formData)
			.retrieve()
			.bodyToMono(PrometheusResponse::class.java)
	}

	/**
	 * 지정된 패턴과 일치하는 모든 파드에 대한 메트릭 데이터를 조회합니다.
	 *
	 * @param pattern 조회할 파드 이름과 일치시킬 정규 표현식 패턴입니다.
	 * @return 각 파드에 대한 메트릭 정보를 포함하는 `Pod` 객체 리스트를 `Mono` 객체로 반환합니다.
	 */
	fun fetchAllMetrics(pattern: String, startDateTime: Optional<Any>, startDuration: Optional<Any>): Mono<List<Pod>> {
		return fetchSpecificPodList(pattern)
			.flatMapMany { podNames ->
				Flux.fromIterable(podNames)
					.flatMap { podName ->
						fetchMetrics("kube_pod_info{pod='$podName'}")
							.flatMap { response ->
								val node = response.data.result
									.firstOrNull()
									?.metric
									?.let { it as? Map<String, String> }
									?.get("node") ?: ""

								Mono.zip(
									Mono.just(podName),
									Mono.just(node),
									fetchNodeCpuTotal(node),
									fetchPodCpuUsage(podName),
									fetchNodeMemoryTotal(node),
									fetchPodMemoryUsage(podName),
									fetchPodAttachedPVCs(podName)
								)
							}
							.map { tuple ->
								Pod(
									podName = tuple.t1,
									cpuTotal = tuple.t3,
									cpuUsage = tuple.t4,
									memoryTotal = tuple.t5,
									memoryUsage = tuple.t6,
									pvcList = tuple.t7
								)
							}
					}
			}
			.collectList()
			.map { podList -> podList }
	}

	/**
	 * 지정된 패턴과 일치하는 파드 목록을 조회합니다.
	 *
	 * @param pattern 파드 이름과 일치할 정규 표현식 패턴입니다.
	 * @return 조회된 파드 이름 리스트를 `Mono` 객체로 반환합니다.
	 */
	fun fetchSpecificPodList(pattern: String): Mono<List<String>> {
		val query = "kube_pod_info{pod=~'.*$pattern.*'}"
		return fetchMetrics(query).map { response -> response.data.result.mapNotNull { it.metric["pod"] }.toList() }
	}

	/**
	 * 지정된 파드의 CPU 사용량을 조회합니다.
	 *
	 * @param podName CPU 사용량을 조회할 파드의 이름입니다.
	 * @return 해당 파드의 CPU 사용량을 문자열로 반환하는 `Mono` 객체입니다.
	 */
	fun fetchPodCpuUsage(podName: String): Mono<String> {
		val query = "rate(container_cpu_usage_seconds_total{pod='$podName', container=''}[5m])"
		return fetchMetrics(query).map { response ->
            (response.data.result
                .map { it.value[1] }
                .firstOrNull() ?: "0").toString()
		}
	}

	/**
	 * 지정된 파드의 메모리 사용량을 조회합니다.
	 *
	 * @param podName 메모리 사용량을 조회할 파드의 이름입니다.
	 * @return 해당 파드의 메모리 사용량을 문자열로 반환하는 `Mono` 객체입니다.
	 */
	fun fetchPodMemoryUsage(podName: String): Mono<String> {
		val query = "container_memory_usage_bytes{pod='$podName', container=''}/1024^3"
		return fetchMetrics(query).map { response ->
            (response.data.result
                .map { it.value[1] }
                .firstOrNull() ?: "0").toString()
		}
	}

	/**
	 * 지정된 파드에 연결된 모든 PVC의 정보를 조회합니다.
	 *
	 * @param podName PVC 정보를 조회할 파드의 이름입니다.
	 * @return 연결된 PVC 목록을 `Pvc` 객체 리스트로 반환하는 `Mono` 객체입니다.
	 */
	fun fetchPodAttachedPVCs(podName: String): Mono<List<Pvc>> {
		val query = "kube_pod_spec_volumes_persistentvolumeclaims_info{pod='$podName'}"
		return fetchMetrics(query).flatMap { response ->
			Flux.fromIterable(response.data.result)
				.flatMap { metricResult ->
					val pvcName = (metricResult.metric as? Map<String, String>)?.get("persistentvolumeclaim") ?: ""
					if (pvcName.isNotEmpty()) {
						Mono.zip(
							Mono.just(pvcName),
							fetchPVCallocation(podName, pvcName),
							fetchPVCUsage(podName, pvcName)
						).map { tuple ->
							Pvc(tuple.t1, tuple.t2, tuple.t3)
						}
					} else {
						Mono.empty<Pvc>()
					}
				}
				.collectList()
		}
	}

	/**
	 * 지정된 파드와 PVC의 할당량을 조회합니다.
	 *
	 * @param podName 할당량을 조회할 파드의 이름입니다.
	 * @param pvcName PVC의 이름입니다.
	 * @return 해당 PVC의 할당량을 문자열로 반환하는 `Mono` 객체입니다.
	 */
	fun fetchPVCallocation(podName: String, pvcName: String): Mono<String> {
		val query = "kube_pod_spec_volumes_persistentvolumeclaims_info{pod='$podName'} * on (persistentvolumeclaim, namespace) group_right kube_persistentvolumeclaim_resource_requests_storage_bytes{persistentvolumeclaim='$pvcName'}/1024^2"
		return fetchMetrics(query).map { response ->
            (response.data.result
                .map { it.value[1] } // value 배열의 두 번째 요소가 할당량을 나타냅니다.
                .firstOrNull() ?: "0").toString()
		}
	}

	/**
	 * 지정된 파드와 PVC의 사용량을 조회합니다.
	 *
	 * @param podName 사용량을 조회할 파드의 이름입니다.
	 * @param pvcName PVC의 이름입니다.
	 * @return 해당 PVC의 사용량을 문자열로 반환하는 `Mono` 객체입니다.
	 */
	fun fetchPVCUsage(podName: String, pvcName: String): Mono<String> {
		val query = "kubelet_volume_stats_used_bytes{persistentvolumeclaim='$pvcName'}/1024^2"
		return fetchMetrics(query).map { response ->
            (response.data.result
                .map { it.value[1] } // value 배열의 두 번째 요소가 사용량을 나타냅니다.
                .firstOrNull() ?: "0").toString()
		}
	}

	/**
	 * 지정된 노드의 CPU 총량을 조회합니다.
	 *
	 * @param nodeName CPU 총량을 조회할 노드의 이름입니다.
	 * @return 해당 노드의 CPU 총량을 문자열로 반환하는 `Mono` 객체입니다.
	 */
	fun fetchNodeCpuTotal(nodeName: String): Mono<String> {
		val query = "kube_node_status_capacity{node='$nodeName', resource='cpu'}"
		return fetchMetrics(query).map { response ->
            (response.data.result
                .map { it.value[1] }
                .firstOrNull() ?: "0").toString()
		}
	}

	/**
	 * 지정된 노드의 메모리 총량을 조회합니다.
	 *
	 * @param nodeName 메모리 총량을 조회할 노드의 이름입니다.
	 * @return 해당 노드의 메모리 총량을 문자열로 반환하는 `Mono` 객체입니다.
	 */
	fun fetchNodeMemoryTotal(nodeName: String): Mono<String> {
		val query = "kube_node_status_capacity{node='$nodeName', resource='memory'}/1024^3"
		return fetchMetrics(query).map { response ->
            (response.data.result
                .map { it.value[1] }
                .firstOrNull() ?: "0").toString()
		}
	}
	
}