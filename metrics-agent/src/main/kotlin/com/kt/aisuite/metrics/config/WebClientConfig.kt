package com.kt.aisuite.metrics.config

import org.springframework.beans.factory.annotation.Value
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.web.reactive.function.client.WebClient

/**
 * WebClientConfig 클래스는 프로메테우스 서버와의 통신을 위한 WebClient 인스턴스를 구성합니다.
 * 이 클래스는 Spring의 설정 클래스로, 프로메테우스 서버의 URL을 기반으로 WebClient 인스턴스를 생성하고 빈으로 등록합니다.
 *
 * @property prometheusServerUrl 프로메테우스 서버의 URL입니다. application.properties 파일에서 설정됩니다.
 */
@Configuration
class WebClientConfig {

	/**
	 * 프로메테우스 서버 URL
	 */
	@Value("\${prometheus.server-url}")
	private lateinit var prometheusServerUrl: String

	/**
	 * 프로메테우스 서버와 통신하기 위한 WebClient 인스턴스를 생성 및 구성합니다.
	 *
	 * @param builder WebClient.Builder 인스턴스입니다. Spring Boot에서 자동으로 제공됩니다.
	 * @return 구성된 WebClient 인스턴스를 반환합니다.
	 */
	@Bean
	fun webClient(builder: WebClient.Builder): WebClient {
		return builder.baseUrl(prometheusServerUrl).build()
	}
}