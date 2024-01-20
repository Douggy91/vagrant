# install-vas

ansible 디렉토리의 INSTALL.sh 실행
일반 실행 시, 디버그 쉘 출력 X, VAS 메세지만 출력 (진행 중)
debug 실행 시, 기존 ansible debug 쉘 출력 (현재)

## Template -> 미적용

template:
  src:
  dest: 

copy와 동일구조로 파일 전달 시, 대상 파일에 해당 변수 적용되어 전달.
- 적용 대상 : Helm Values, kubernetes manifest.yaml

## ENV 파일  - role/rke2-cluster/vars/main.yaml 
실행에 필요한 환경변수들로 기술된 변수들 이외에는 수정 불필요

### OSS HLEM 관련 
- BLACKBOX_EXPORTER_VERS = OSS HELM 연동 정보

### RESOURCE 파일 위치
- LOCAL_PATH:
    BASE = INSTALL RESOURCE 위치
    PACKAGES = INSTALL RESOURCE의 packages 위치 ( 현행  149번(rn01)의 tmp내 파일구조와 일치 )

### ARGOCD 관련
- CLUSTER_IP: ARGOCD가 바라보는 Cluster의 url
- ARGO_USER
- ARGO_PASSWORD
- ARGO_CONNECTED_SCM = ARGOCD에서 참조할 형상 관리 시스템(GITEA)

### PSQL PASSWD
PGPASSWD

### 내부 GITEA 연동
GITEA_USER
GITEA_PASSWD

### 다중 컨트롤 노드 시, 연결 부
CONTROL_NODE_IP

### 내부 Nexus Repo
REGISTRY_URL
REGISTRY_ID
REGISTRY_PASSWD

### 단일 컨트롤 노드 시, MASTER (삭제예정)
MASTER_NODE_IP: "10.71.162.155"
#S3_PATH_BASE: "s3{{ ':' }}//s3-onebox-test-01-repository-01"
NET_CONF_DIR: /etc/NetworkManager/conf.d
NET_CONF_FILE: "{{ NET_CONF_DIR }}/rke2-canal.conf"
RANCHER_ADMIN_PASSWORD: "admin12341234"
MARIADB_ROOT_PASSWORD: "admin12341234"
MYSQL_PASSWORD: "admin12341234"

