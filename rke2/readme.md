## 1. Directory 구조
- kubeadm : kubeadm 기반의 Vanila k8s 설치용 스크립트
- rke2 : rke2 기반의 Rancher 엔진을 사용하는 k8s 설치용 스크립트

ansible
├─kubeadm
│  ├─role
│  │  ├─k8s-base
│  │  ├─k8s-connect
│  │  ├─k8s-init
│  │  └─k8s-workers
│  └─vars
└─rke2
    ├─role
    │  ├─control
    │  ├─deploy_app
    │  │  ├─files
    │  │  │  ├─argocd_yaml
    │  │  │  ├─init_yaml
    │  │  │  └─oss_yaml
    │  ├─masters-connect
    │  ├─masters-init
    │  ├─nodes
    │  │  ├─templates
    │  │  │  └─init_yaml
    │  └─workers
    └─vars

## 2. 실행 순서

- 필요한 리소스를 위치시킨 후, 진행
    - ansible.tar : ansible 설치용 스크립트가 위치한 아카이브
    - opt_nexus_data.tar.gz : nexus용 이미지가 위치한 아카이브
    - gitea.tar : gitea 소스가 담긴 아카이브
    - packages.tar : 설치에 필요한 rpm 및 여타 리소스들이 위치한 아카이브

- ansible-install.sh를 통해서 대화형으로 ansible-core를 설치
