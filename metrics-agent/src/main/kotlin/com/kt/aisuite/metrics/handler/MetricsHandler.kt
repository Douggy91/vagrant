package com.kt.aisuite.metrics.handler

import com.kt.aisuite.metrics.service.MetricsService
import org.springframework.stereotype.Component
import org.springframework.web.reactive.function.server.ServerRequest
import org.springframework.web.reactive.function.server.ServerResponse
import reactor.core.publisher.Mono

/**
 * MetricsHandler 클래스는 웹 요청을 처리하고 메트릭 데이터를 반환하는 핸들러입니다.
 * 이 클래스는 Spring WebFlux의 ServerRequest를 사용하여 HTTP 요청을 처리하고,
 * MetricsService를 통해 조회된 메트릭 데이터를 HTTP 응답으로 반환합니다.
 *
 * @property service MetricsService 인스턴스로, 메트릭 데이터를 조회하는데 사용됩니다.
 */
@Component
class MetricsHandler(private val service: MetricsService) {

	/**
	 * 지정된 이름에 해당하는 메트릭 데이터를 조회하고, 조회된 데이터를 HTTP 응답으로 반환합니다.
	 * 데이터가 없을 경우 404 Not Found 응답을 반환합니다.
	 *
	 * @param request 웹 요청을 나타내는 ServerRequest 객체입니다.
	 * @return 메트릭 데이터를 포함하는 HTTP 응답의 Mono 객체를 반환합니다.
	 */
	fun getMetrics(request: ServerRequest)
		= service.fetchAllMetrics(request.pathVariable("name"), request.attribute("startDateTime"), request.attribute("startDuration"))
			.flatMap { metrics -> ServerResponse.ok().bodyValue(metrics) }
			.switchIfEmpty(ServerResponse.notFound().build())
//, request.attribute("startDateTime"), request.attribute("startDuration")

	/**
	 * 그냥 테스트용
	 *
	 * @param request 웹 요청을 나타네는 ServerRequest 객체입니다.
	 */
	fun getTest(request: ServerRequest)
		= Mono.just("hello")
			.flatMap { responseString -> ServerResponse.ok().bodyValue(responseString) }
}
