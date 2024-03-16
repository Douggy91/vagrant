├─kubeadm
│  ├─role
│  │  ├─k8s-base
│  │  │  ├─defaults
│  │  │  ├─files
│  │  │  │  └─config
│  │  │  ├─handlers
│  │  │  ├─meta
│  │  │  ├─tasks
│  │  │  ├─templates
│  │  │  └─tests
│  │  ├─k8s-connect
│  │  │  ├─defaults
│  │  │  ├─handlers
│  │  │  ├─meta
│  │  │  ├─tasks
│  │  │  └─tests
│  │  ├─k8s-init
│  │  │  ├─defaults
│  │  │  ├─handlers
│  │  │  ├─meta
│  │  │  ├─tasks
│  │  │  ├─templates
│  │  │  └─tests
│  │  └─k8s-workers
│  │      ├─defaults
│  │      ├─handlers
│  │      ├─meta
│  │      ├─tasks
│  │      └─tests
│  └─vars
└─rke2
    ├─role
    │  ├─control
    │  │  ├─defaults
    │  │  ├─files
    │  │  ├─handlers
    │  │  ├─meta
    │  │  ├─tasks
    │  │  └─tests
    │  ├─deploy_app
    │  │  ├─defaults
    │  │  ├─files
    │  │  │  ├─argocd_yaml
    │  │  │  │  ├─aibot
    │  │  │  │  │  ├─chat-ui
    │  │  │  │  │  ├─cms
    │  │  │  │  │  ├─engine
    │  │  │  │  │  ├─gateway
    │  │  │  │  │  ├─master
    │  │  │  │  │  └─scheduler
    │  │  │  │  ├─amp
    │  │  │  │  │  ├─amp
    │  │  │  │  │  └─smp
    │  │  │  │  │      ├─bot
    │  │  │  │  │      ├─chub
    │  │  │  │  │      ├─stt
    │  │  │  │  │      └─tts
    │  │  │  │  ├─chub
    │  │  │  │  │  ├─agw
    │  │  │  │  │  ├─cms
    │  │  │  │  │  ├─consumer
    │  │  │  │  │  ├─sgw
    │  │  │  │  │  ├─tsm
    │  │  │  │  │  └─vgw
    │  │  │  │  ├─chub_monitoring
    │  │  │  │  │  ├─dppp
    │  │  │  │  │  ├─mbt
    │  │  │  │  │  ├─otel
    │  │  │  │  │  └─prom
    │  │  │  │  ├─kube-state-metric
    │  │  │  │  ├─metrics-agent
    │  │  │  │  ├─prometheus
    │  │  │  │  ├─stt
    │  │  │  │  │  ├─cpod
    │  │  │  │  │  ├─epod
    │  │  │  │  │  └─mpod
    │  │  │  │  └─tts
    │  │  │  ├─init_yaml
    │  │  │  └─oss_yaml
    │  │  ├─handlers
    │  │  ├─meta
    │  │  ├─tasks
    │  │  └─tests
    │  ├─masters-connect
    │  │  ├─defaults
    │  │  ├─files
    │  │  ├─handlers
    │  │  ├─meta
    │  │  ├─tasks
    │  │  └─tests
    │  ├─masters-init
    │  │  ├─defaults
    │  │  ├─files
    │  │  ├─handlers
    │  │  ├─meta
    │  │  ├─tasks
    │  │  └─tests
    │  ├─nodes
    │  │  ├─defaults
    │  │  ├─files
    │  │  ├─handlers
    │  │  ├─meta
    │  │  ├─tasks
    │  │  ├─templates
    │  │  │  └─init_yaml
    │  │  └─tests
    │  └─workers
    │      ├─defaults
    │      ├─files
    │      ├─handlers
    │      ├─meta
    │      ├─tasks
    │      └─tests
    └─vars