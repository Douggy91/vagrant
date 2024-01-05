package com.kt.aisuite.metrics.model

/**
 * Pvc 클래스는 Kubernetes의 Persistent Volume Claim(PVC)에 대한 메트릭 정보를 표현합니다.
 * 이 클래스는 PVC 이름, 할당량, 현재 사용량을 포함합니다.
 *
 * @property pvcName PVC의 이름입니다.
 * @property pvcAllocation PVC에 할당된 리소스 양입니다.
 * @property pvcUsage PVC의 현재 사용량입니다.
 */
data class Pvc(
    val pvcName: String,
    val pvcAllocation: String,
    val pvcUsage: String
)