#!/usr/bin/bash

VAR_FILE=vars/main.yaml

if [ ! -f $VAR_FILE ]; then
  echo "Error: VAR_FILE Not Found"
  exit 1
fi

##### USER #####
USER=`cat $VAR_FILE | awk -F ':' 'NR==2 {print $2}'`
if [ -z "$USER" ] || [ -z "$(echo "$USER" | tr -d '[:space:]')" ]; then
  echo "Error: USER Not Found"
  exit 1
else
  echo "USER 변수 값: $USER"
  sed -i -e "s,USE_USER,$USER,g" install-vas.yaml
fi



##### INSTALL RESOURCE #####
BASE=`cat $VAR_FILE | awk -F ':' 'NR==6 {print $2}'`
if [ -z "$BASE" ] || [ -z "$(echo "$BASE" | tr -d '[:space:]')" ]; then
  echo "Error: LOCAL_PATH.BASE Not Found"
  exit 1
else
  echo "LOCAL_PATH.BASE 변수 값: $BASE"
fi

PACKAGES=`cat $VAR_FILE | awk -F ':' 'NR==7 {print $2}'`
if [ -z "$PACKAGES" ] || [ -z "$(echo "$PACKAGES" | tr -d '[:space:]')" ]; then
  echo "Error: LOCAL_PATH.PACKAGES Not Found"
  exit 1
else
  echo "LOCAL_PATH.PACKAGES 변수 값: $PACKAGES"
fi

##### ARGO CD #####
CLUSTER_IP=`cat $VAR_FILE | awk -F ':' 'NR==10 {print $2}'`
if [ -z "$CLUSTER_IP" ] || [ -z "$(echo "$CLUSTER_IP" | tr -d '[:space:]')" ]; then
  echo "Error: CLUSTER_IP Not Found"
  exit 1
else
  echo "CLUSTER_IP 변수 값: $CLUSTER_IP"
fi
ARGO_USER=`cat $VAR_FILE | awk -F ':' 'NR==11 {print $2}'`
if [ -z "$ARGO_USER" ] || [ -z "$(echo "$ARGO_USER" | tr -d '[:space:]')" ]; then
  echo "Error: ARGO_USER Not Found"
  exit 1
else
  echo "ARGO_USER 변수 값: $ARGO_USER"
fi
ARGO_PASSWORD=`cat $VAR_FILE | awk -F ':' 'NR==12 {print $2}'`
if [ -z "$ARGO_PASSWORD" ] || [ -z "$(echo "$ARGO_PASSWORD" | tr -d '[:space:]')" ]; then
  echo "Error: ARGO_PASSWORD Not Found"
  exit 1
else
  echo "ARGO_PASSWORD 변수 값: $ARGO_PASSWORD"
fi
ARGO_CONNECTED_SCM=`cat $VAR_FILE | awk -F ':' 'NR==13 {print $2}'`
if [ -z "$ARGO_CONNECTED_SCM" ] || [ -z "$(echo "$ARGO_CONNECTED_SCM" | tr -d '[:space:]')" ]; then
  echo "Error: ARGO_CONNECTED_SCM Not Found"
  exit 1
else
  echo "ARGO_CONNECTED_SCM 변수 값: $ARGO_CONNECTED_SCM"
fi

##### GITEA ######
GITEA_USER=`cat $VAR_FILE | awk -F ':' 'NR==16 {print $2}'`
if [ -z "$GITEA_USER" ] || [ -z "$(echo "$GITEA_USER" | tr -d '[:space:]')" ]; then
  echo "Error: GITEA_USER Not Found"
  exit 1
else
  echo "GITEA_USER 변수 값: $GITEA_USER"
fi

GITEA_PASSWD=`cat $VAR_FILE | awk -F ':' 'NR==17 {print $2}'`
if [ -z "$GITEA_PASSWD" ] || [ -z "$(echo "$GITEA_PASSWD" | tr -d '[:space:]')" ]; then
  echo "Error: GITEA_PASSWD Not Found"
  exit 1
else
  echo "GITEA_PASSWD 변수 값: $GITEA_PASSWD"
fi

GITEA_URL=`cat $VAR_FILE | awk -F ':' 'NR==18 {print $2}' | tr -d "\"" | tr -d " "`
if [ -z "$GITEA_URL" ] || [ -z "$(echo "$GITEA_URL" | tr -d '[:space:]')" ]; then
  echo "Error: GITEA_URL Not Found"
  exit 1
else
  echo "GITEA_URL 변수 값: $GITEA_URL"
fi

GITEA_PORT=`cat $VAR_FILE | awk -F ':' 'NR==19 {print $2}'`
if [ -z "$GITEA_PORT" ] || [ -z "$(echo "$GITEA_PORT" | tr -d '[:space:]')" ]; then
  echo "Error: GITEA_PORT Not Found"
  exit 1
else
  echo "GITEA_PORT 변수 값: $GITEA_PORT"
fi

GITEA_DIR=`cat $VAR_FILE | awk -F ':' 'NR==20 {print $2}' | tr -d "\"" | tr -d " "`
if [ -z "$GITEA_DIR" ] || [ -z "$(echo "$GITEA_DIR" | tr -d '[:space:]')" ]; then
  echo "Error: GITEA_DIR Not Found"
  exit 1
else
  echo "GITEA_DIR 변수 값: $GITEA_DIR"
  sed -i -e "s,10.71.164.149,$GITEA_URL,g" $GITEA_DIR/data/gitea/conf/app.ini
fi

##### CONTROL_NODE_IP #####
CONTROL_NODE_IP=`cat $VAR_FILE | awk -F ':' 'NR==23 {print $2}'`
if [ -z "$CONTROL_NODE_IP" ] || [ -z "$(echo "$CONTROL_NODE_IP" | tr -d '[:space:]')" ]; then
  echo "Error: CONTROL_NODE_IP Not Found"
  exit 1
else
  echo "CONTROL_NODE_IP 변수 값: $CONTROL_NODE_IP"
fi

##### NEXUS #####
HELM_PORT=`cat $VAR_FILE | awk -F ':' 'NR==26 {print $2}'`
if [ -z "$HELM_PORT" ] || [ -z "$(echo "$HELM_PORT" | tr -d '[:space:]')" ]; then
  echo "Error: HELM_PORT Not Found"
  exit 1
else
  echo "HELM_PORT 변수 값: $HELM_PORT"
fi

REGISTRY_PORT=`cat $VAR_FILE | awk -F ':' 'NR==27 {print $2}'`
if [ -z "$REGISTRY_PORT" ] || [ -z "$(echo "$REGISTRY_PORT" | tr -d '[:space:]')" ]; then
  echo "Error: REGISTRY_PORT Not Found"
  exit 1
else
  echo "REGISTRY_PORT 변수 값: $REGISTRY_PORT"
fi

REGISTRY_URL=`cat $VAR_FILE | awk -F ':' 'NR==28 {print $2}'`
if [ -z "$REGISTRY_URL" ] || [ -z "$(echo "$REGISTRY_URL" | tr -d '[:space:]')" ]; then
  echo "Error: REGISTRY_URL Not Found"
  exit 1
else
  echo "REGISTRY_URL 변수 값: $REGISTRY_URL"
fi

REGISTRY_ID=`cat $VAR_FILE | awk -F ':' 'NR==29 {print $2}'`
if [ -z "$REGISTRY_ID" ] || [ -z "$(echo "$REGISTRY_ID" | tr -d '[:space:]')" ]; then
  echo "Error: REGISTRY_ID Not Found"
  exit 1
else
  echo "REGISTRY_ID 변수 값: $REGISTRY_ID"
fi

REGISTRY_PASSWD=`cat $VAR_FILE | awk -F ':' 'NR==30 {print $2}'`
if [ -z "$REGISTRY_PASSWD" ] || [ -z "$(echo "$REGISTRY_PASSWD" | tr -d '[:space:]')" ]; then
  echo "Error: REGISTRY_PASSWD Not Found"
  exit 1
else
  echo "REGISTRY_PASSWD 변수 값: $REGISTRY_PASSWD"
fi

NEXUS_DIR=`cat $VAR_FILE | awk -F ':' 'NR==31 {print $2}'`
if [ -z "$NEXUS_DIR" ] || [ -z "$(echo "$NEXUS_DIR" | tr -d '[:space:]')" ]; then
  echo "Error: NEXUS_DIR Not Found"
  exit 1
else
  echo "NEXUS_DIR 변수 값: $NEXUS_DIR"
fi

##### DOMANI_NAME #####
DOMAIN_NAME=`cat $VAR_FILE | awk -F ':' 'NR==37 {print $2}'`
if [ -z "$DOMAIN_NAME" ] || [ -z "$(echo "$DOMAIN_NAME" | tr -d '[:space:]')" ]; then
  echo "Error: DOMAIN_NAME Not Found"
  exit 1
else
  echo "DOMAIN_NAME 변수 값: $DOMAIN_NAME"
fi

TAGS="nginx-rpm, docker-rpm, mariaclient, nginx-setting, docker, nexus, gitea, kube, masters_init, resource-copy, resource-install, network-config, config-kubetools, system-params-init, rke2-init, config-kubeconfig, prepare-connect, config-kubetools-init, masters-connect, system-params-connect, rke2-init-connect ,config-kubeconfig-connect, worker-connect, system-params-worker, rke2-init-worker, config-kubeconfig-worker,labels, application, roles, taints, oss_setup, set_resource_oss, set_helm ,deploy_db ,monitoring ,deploy_dashboard ,check_maria ,wait_maria ,set_db ,cleanup_db ,deploy_argocd ,get_resource_argocd ,git_resource ,set_argocd ,deploy_chub ,deploy_tts ,deploy_stt ,deploy_aibot ,deploy_amp ,deploy_monitoring ,otel-operator ,fluent-bit ,vas-chub ,k8s-prom"

if [ -z "$1" ]; then
  ansible-playbook install-vas.yaml
else
  CHOOSEN=`echo $TAGS | awk -F $1 '{print $2}'`
  ansible-playbook install-vas.yaml -t "$CHOOSEN"
fi
