── kube-flannel.yml
├── main.sh
├── priv_base_install.yaml
├── priv_master_connect.yaml
├── priv_master_init.yaml
├── priv_worker_connect.yaml
├── role
│   ├── k8s-base
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── files
│   │   │   ├── images
│   │   │   │   ├── 10-kubeadm.conf
│   │   │   │   ├── config.toml
│   │   │   │   ├── crictl.yaml
│   │   │   │   ├── daemon.json
│   │   │   │   ├── get_images
│   │   │   │   ├── images_pull
│   │   │   │   ├── images_pull.backup
│   │   │   │   └── kubelet.service
│   │   │   └── ubuntu
│   │   │       ├── 2_apt_crio
│   │   │       │   ├── conmon_2.1.2~0_amd64.deb
│   │   │       │   ├── containers-common_1-22_all.deb
│   │   │       │   ├── cri-o_1.26.4~1_amd64.deb
│   │   │       │   ├── cri-o-runc_1.1.9~1_amd64.deb
│   │   │       │   ├── cri-tools_1.25.0~0_amd64.deb
│   │   │       │   ├── libcap2_2.48-1_amd64.deb
│   │   │       │   ├── libcap2-bin_2.48-1_amd64.deb
│   │   │       │   └── libpam-cap_2.48-1_amd64.deb
│   │   │       ├── 2_update_docker
│   │   │       │   ├── containerd.io_1.6.26-1_amd64.deb
│   │   │       │   ├── docker-buildx-plugin_0.11.2-1~ubuntu.22.04~jammy_amd64.deb
│   │   │       │   ├── docker-ce_5%3a24.0.7-1~ubuntu.22.04~jammy_amd64.deb
│   │   │       │   ├── docker-ce-cli_5%3a24.0.7-1~ubuntu.22.04~jammy_amd64.deb
│   │   │       │   ├── docker-ce-rootless-extras_5%3a24.0.7-1~ubuntu.22.04~jammy_amd64.deb
│   │   │       │   ├── docker-compose-plugin_2.21.0-1~ubuntu.22.04~jammy_amd64.deb
│   │   │       │   ├── libltdl7_2.4.6-15build2_amd64.deb
│   │   │       │   ├── libslirp0_4.6.1-1build1_amd64.deb
│   │   │       │   ├── lock
│   │   │       │   ├── partial
│   │   │       │   ├── pigz_2.6-1_amd64.deb
│   │   │       │   └── slirp4netns_1.0.1-2_amd64.deb
│   │   │       ├── 3_k8s_tools
│   │   │       │   ├── conntrack_1%3a1.4.6-2build2_amd64.deb
│   │   │       │   ├── cri-tools_1.26.0~1_amd64.deb
│   │   │       │   ├── ebtables_2.0.11-4build2_amd64.deb
│   │   │       │   ├── gnupg2_2.2.27-3ubuntu2.1_all.deb
│   │   │       │   ├── gnupg_2.2.27-3ubuntu2.1_all.deb
│   │   │       │   ├── kubeadm_1.28.2-00_amd64.deb
│   │   │       │   ├── kubectl_1.28.2-00_amd64.deb
│   │   │       │   ├── kubelet_1.28.2-00_amd64.deb
│   │   │       │   ├── kubernetes-cni_1.2.0-00_amd64.deb
│   │   │       │   ├── lock
│   │   │       │   ├── partial
│   │   │       │   └── socat_1.7.4.1-3ubuntu4_amd64.deb
│   │   │       ├── base.tar
│   │   │       ├── cni-plugins-linux-amd64-v1.3.0.tgz
│   │   │       ├── crictl-v1.27.0-linux-amd64.tar.gz
│   │   │       ├── docker.tar
│   │   │       ├── readme.md
│   │   │       └── runc.tar
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── meta
│   │   │   └── main.yml
│   │   ├── README.md
│   │   ├── tasks
│   │   │   ├── crio.yml
│   │   │   ├── docker.yml
│   │   │   ├── k8s_base.yml
│   │   │   ├── k8s_tools.yml
│   │   │   └── main.yml
│   │   ├── tests
│   │   │   ├── inventory
│   │   │   └── test.yml
│   │   └── vars
│   │       └── main.yml
│   ├── k8s-connect
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── files
│   │   │   └── k8s_yaml
│   │   │       ├── calico.yaml
│   │   │       ├── helm-v3.13.3-linux-amd64.tar.gz
│   │   │       └── ingress_controller.yaml
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── meta
│   │   │   └── main.yml
│   │   ├── README.md
│   │   ├── tasks
│   │   │   ├── k8s_cluster_connect.yml
│   │   │   └── main.yml
│   │   ├── tests
│   │   │   ├── inventory
│   │   │   └── test.yml
│   │   └── vars
│   │       └── main.yml
│   ├── k8s-init
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── files
│   │   │   └── k8s_yaml
│   │   │       ├── calico.yaml
│   │   │       ├── helm-v3.13.3-linux-amd64.tar.gz
│   │   │       ├── ingress_controller.yaml
│   │   │       └── kube-flannel.yml
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── meta
│   │   │   └── main.yml
│   │   ├── README.md
│   │   ├── tasks
│   │   │   ├── k8s_cluster_init.yml
│   │   │   └── main.yml
│   │   ├── tests
│   │   │   ├── inventory
│   │   │   └── test.yml
│   │   └── vars
│   │       └── main.yml
│   └── k8s-workers
│       ├── defaults
│       │   └── main.yml
│       ├── files
│       │   └── k8s_yaml
│       │       ├── calico.yaml
│       │       ├── helm-v3.13.3-linux-amd64.tar.gz
│       │       └── ingress_controller.yaml
│       ├── handlers
│       │   └── main.yml
│       ├── meta
│       │   └── main.yml
│       ├── README.md
│       ├── tasks
│       │   ├── k8s_cluster_worker.yml
│       │   └── main.yml
│       ├── tests
│       │   ├── inventory
│       │   └── test.yml
│       └── vars
│           └── main.yml
└── test_book


# 사전 세팅

1. 다음의 파일을 다운로드 후 다음 디렉터리에 위치

nexus.tar -> /opt
base.tar -> ./role/k8s_base/files/ubuntu/
cni-plugins-linux-amd64-v1.3.0.tgz -> ./role/k8s_base/files/ubuntu/
crictl-v1.27.0-linux-amd64.tar.gz -> ./role/k8s_base/files/ubuntu/

2. Nexus.tar를 /opt에 풀고 /etc/systemd/system/nexus.service에 등록

[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Group=nexus
Restart=on-abort
TimeoutSec=600

[Install]
WantedBy=multi-user.target