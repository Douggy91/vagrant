### default/metrics-agent 수동 배포시 커맨드
### CD 구성시 git 배포시 자동 배포 (CD 디렉토리 참조)

# default namespace
# kubectl create namespace default

# metrics-agent manifest
kubectl apply -k .
