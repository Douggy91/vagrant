#!/usr/bin/bash

VAR_FILE=vars/main.yaml

if [ ! -f $VAR_FILE ]; then
  echo "Error: VAR_FILE Not Found"
  exit 1
fi


USER=`cat $VAR_FILE | awk -F ':' 'NR==4 {print $2}'`
if [ -z "$USER" ] || [ -z "$(echo "$USER" | tr -d '[:space:]')" ]; then
  echo "Error: USER Not Found"
  exit 1
else
  echo "USER 변수 값: $USER"
fi


AIBOT_VER=`cat $VAR_FILE | awk -F ':' 'NR==8 {print $2}'`
if [ -z "$AIBOT_VER" ] || [ -z "$(echo "$AIBOT_VER" | tr -d '[:space:]')" ]; then
  echo "Error: AIBOT_VER Not Found"
  exit 1
else
  echo "AIBOT_VER 변수 값: $AIBOT_VER"
fi

BASE=`cat $VAR_FILE | awk -F ':' 'NR==13 {print $2}'`
if [ -z "$BASE" ] || [ -z "$(echo "$BASE" | tr -d '[:space:]')" ]; then
  echo "Error: LOCAL_PATH.BASE Not Found"
  exit 1
else
  echo "LOCAL_PATH.BASE 변수 값: $BASE"
fi

PACKAGES=`cat $VAR_FILE | awk -F ':' 'NR==14 {print $2}'`
if [ -z "$PACKAGES" ] || [ -z "$(echo "$PACKAGES" | tr -d '[:space:]')" ]; then
  echo "Error: LOCAL_PATH.PACKAGES Not Found"
  exit 1
else
  echo "LOCAL_PATH.PACKAGES 변수 값: $PACKAGES"
fi

GITEA_URL=`cat $VAR_FILE | awk -F ':' 'NR==27 {print $2}'`
if [ -z "$GITEA_URL" ] || [ -z "$(echo "$GITEA_URL" | tr -d '[:space:]')" ]; then
  echo "Error: GITEA_URL Not Found"
  exit 1
else
  echo "GITEA_URL 변수 값: $GITEA_URL"
fi

GITEA_DIR=`cat $VAR_FILE | awk -F ':' 'NR==29 {print $2}'`
if [ -z "$GITEA_DIR" ] || [ -z "$(echo "$GITEA_DIR" | tr -d '[:space:]')" ]; then
  echo "Error: GITEA_DIR Not Found"
  exit 1
else
  echo "GITEA_DIR 변수 값: $GITEA_DIR"
fi

CONTROL_NODE_IP=`cat $VAR_FILE | awk -F ':' 'NR==33 {print $2}'`
if [ -z "$CONTROL_NODE_IP" ] || [ -z "$(echo "$CONTROL_NODE_IP" | tr -d '[:space:]')" ]; then
  echo "Error: CONTROL_NODE_IP Not Found"
  exit 1
else
  echo "CONTROL_NODE_IP 변수 값: $CONTROL_NODE_IP"
fi

REGISTRY_URL=`cat $VAR_FILE | awk -F ':' 'NR==39 {print $2}'`
if [ -z "$REGISTRY_URL" ] || [ -z "$(echo "$REGISTRY_URL" | tr -d '[:space:]')" ]; then
  echo "Error: REGISTRY_URL Not Found"
  exit 1
else
  echo "REGISTRY_URL 변수 값: $REGISTRY_URL"
fi

NEXUS_DIR=`cat $VAR_FILE | awk -F ':' 'NR==42 {print $2}'`
if [ -z "$NEXUS_DIR" ] || [ -z "$(echo "$NEXUS_DIR" | tr -d '[:space:]')" ]; then
  echo "Error: NEXUS_DIR Not Found"
  exit 1
else
  echo "NEXUS_DIR 변수 값: $NEXUS_DIR"
fi

DOMAIN_NAME=`cat $VAR_FILE | awk -F ':' 'NR==49 {print $2}'`
if [ -z "$DOMAIN_NAME" ] || [ -z "$(echo "$DOMAIN_NAME" | tr -d '[:space:]')" ]; then
  echo "Error: DOMAIN_NAME Not Found"
  exit 1
else
  echo "DOMAIN_NAME 변수 값: $DOMAIN_NAME"
fi

ansible-playbook install-vas.yaml $1