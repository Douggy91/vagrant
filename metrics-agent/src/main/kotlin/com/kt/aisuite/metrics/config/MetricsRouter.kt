package com.kt.aisuite.metrics.config

import com.kt.aisuite.metrics.handler.MetricsHandler
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.web.reactive.function.server.router

/**
 * MetricsRouter 클래스는 HTTP 요청을 해당 핸들러 메소드로 라우팅하는 구성을 제공합니다.
 * 이 클래스는 Spring WebFlux의 라우터 기능을 사용하여 특정 URL 경로에 대한 요청을 처리하는 핸들러 메소드로 연결합니다.
 *
 * @property handler MetricsHandler 인스턴스로, 실제 요청을 처리하는 핸들러 메소드를 포함합니다.
 */
@Configuration
class MetricsRouter(private val handler: MetricsHandler) {

	/**
	 * 메트릭스 관련 HTTP 요청을 처리하는 라우팅 구성을 제공합니다.
	 * 이 함수는 "/api/v1/metrics/pod/{name}" URL 경로에 대한 GET 요청을 MetricsHandler의 getMetrics 메소드로 라우팅합니다.
	 *
	 * @return 라우터 함수 구성을 나타내는 RouterFunction 객체입니다.
	 */
	@Bean
	fun metricsRoute() = router {
		"/api/v1".nest {
			GET("/metrics/pod/{name}", handler::getMetrics)
			GET("/test", handler::getTest)
		}
	}
}
