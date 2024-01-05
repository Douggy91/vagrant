package com.kt.aisuite.metrics.model

/**
 * PrometheusResponse 클래스는 프로메테우스 API 응답의 구조를 나타냅니다.
 * 이 클래스는 API 응답의 상태와 데이터를 포함합니다.
 *
 * @property status API 응답의 상태를 나타냅니다.
 * @property data API 응답에서 반환된 실제 데이터입니다.
 */
data class PrometheusResponse(
	val status: String,
	val data: Data
)

/**
 * Data 클래스는 프로메테우스 API 응답 내의 데이터 부분을 나타냅니다.
 * 이 클래스는 결과 타입과 결과 데이터 목록을 포함합니다.
 *
 * @property resultType 결과의 타입을 나타냅니다.
 * @property result 메트릭 데이터 목록입니다.
 */
data class Data(
	val resultType: String,
	val result: List<Result>
)

/**
 * Result 클래스는 프로메테우스 쿼리 결과의 개별 항목을 나타냅니다.
 * 이 클래스는 메트릭 정보와 해당 메트릭의 값들을 포함합니다.
 *
 * @property metric 메트릭 정보입니다.
 * @property value 메트릭 값 목록입니다.
 */
data class Result(
	val metric: Map<String, String>,
	val value: List<Any>
)