package com.kt.aisuite.metrics.model

/**
 * Pod 클래스는 Kubernetes 파드의 주요 메트릭 정보를 표현합니다.
 * 이 클래스는 파드 이름, CPU 총량 및 사용량, 메모리 총량 및 사용량, 연결된 PVC 목록을 포함합니다.
 *
 * @property podName 파드의 이름입니다.
 * @property cpuTotal 파드가 실행 중인 노드의 CPU 총량입니다.
 * @property cpuUsage 파드의 현재 CPU 사용량입니다.
 * @property memoryTotal 파드가 실행 중인 노드의 메모리 총량입니다.
 * @property memoryUsage 파드의 현재 메모리 사용량입니다.
 * @property pvcList 파드에 연결된 PVC 목록입니다.
 */
data class Pod(
    val podName: String,
    val cpuTotal: String,
    val cpuUsage: String,
    val memoryTotal: String,
    val memoryUsage: String,
    val pvcList: List<Pvc>
)