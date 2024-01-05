# metrics-agent

# 실행 방법

## 1. Build & Dockerize

프로젝트 “/”에서 이하 커맨드 실행

```bash
docker build -t 10.71.164.149:5000/test/metrics-agent:0.0.1 .
```

Build만 하고 싶을 경우

```bash
./gradlew bootJar -x test
```

## 2. Docker run

```bash
docker network create test-net

docker run \
  --name metrics-agent \
  --network test-net \
  -p 8080:8080 \
  -v "/logs:/logs" \
  -d 10.71.164.149:5000/test/metrics-agent:0.0.1
```

## 3. Docker push

```bash
# 필요시
docker save -o metrics-agent_0_0_1.tar 10.71.164.149:5000/test/metrics-agent:0.0.1
docker load < ./metrics-agent_0_0_1.tar
# push
docker push 10.71.164.149:5000/test/metrics-agent:0.0.1
```

## 4. K8S Apply

(수동 배포) kubectl 가능한 local에 /manifest 파일 업로드 후에 해당 경로에서

```bash
kubectl apply -k .

# 혹은
kubectl apply metrics-agent-configmap.yaml
kubectl apply metrics-agent-fluentbit-configmap.yaml
kubectl apply metrics-agent-deploy.yaml
kubectl apply metrics-agent-ingress.yaml
kubectl apply metrics-agent-service.yaml
```

## 5. Application Usage

REST API
```bash
GET /api/v1/metrics/pod/{name}
- podname like %${name}% 와 동일한 방식으로 pod 목록을 추출하여, 해당 pod의 metrics data를 전송.
- response body : [${POD}, ..] 형태로 전달

GET /api/v1/test
- 단순 통신 테스트 용도

GET /actuator
- helth check

fun metricsRoute() = router {
    "/api/v1".nest {
        GET("/metrics/pod/{name}", handler::getMetrics)
        GET("/test", handler::getTest)
    }
}
```

% 수집 대상 prometheus url은 k8s configmap에서 변경 가능
% 봉인 해제된 신동하C의 코드