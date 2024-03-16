#!/bin/bash

#aws s3 cp s3://s3-onebox-test-01-repository-01/packages/ansible /tmp/ansible/ --recursive

read -p "Please input your Resource Dir : " DIR_PATH

ANSIBLE_PACKAGES=("sshpass-1.09-4.el8.x86_64" "python3.11-setuptools-wheel-65.5.1-2.el8.noarch" \
"python3.11-pip-wheel-22.3.1-4.el8.noarch" "python3-jmespath-0.9.0-11.el8.noarch" \
"mpdecimal-2.5.1-3.el8.x86_64" "python3.11-libs-3.11.5-1.el8_9.x86_64" \
"python3.11-3.11.5-1.el8_9.x86_64" "python3.11-ply-3.11-1.el8.noarch" \
"python3.11-pycparser-2.20-1.el8.noarch" "python3.11-cffi-1.15.1-1.el8.x86_64" \
"python3.11-cryptography-37.0.2-5.el8.x86_64" "python3.11-pyyaml-6.0-1.el8.x86_64" \
"git-core-2.39.3-1.el8_8.x86_64" "ansible-core-2.15.3-1.el8.x86_64" "ansible-8.3.0-1.el8.noarch")

for PACKAGE in "${ANSIBLE_PACKAGES[@]}"; do
  rpm -Uvh "$DIR_PATH/packages/ansible/${PACKAGE}.rpm"
done



read -p "NIC_NAME : " NIC_NAME
HOSTIP=$(ip addr | grep -w inet | grep -E "$NIC_NAME" | awk '{print $2}' | cut -d '/' -f 1)
echo $HOSTIP

echo -e "127.0.0.1       localhost\n$HOSTIP rke2-control-node01" > /etc/hosts;
echo -e "control:\n  hosts:\n    rke2-control-node01:\n" >> /etc/ansible/hosts;

read -p "please input 3 controlplane ip : " CON_IP
CON_IP="${CON_IP// /}"
IFS=',' read -ra CON_IP_ARRAY <<< "$CON_IP"
echo -e "${CON_IP_ARRAY[0]} rke2-master-node01" >> /etc/hosts;
echo -e "${CON_IP_ARRAY[1]} rke2-master-node02" >> /etc/hosts;
echo -e "${CON_IP_ARRAY[2]} rke2-master-node03" >> /etc/hosts;
echo -e "k8s-cluster:\n  children:\n    masters-init:\n      hosts:\n        rke2-master-node01:" >> /etc/ansible/hosts;
echo -e "    masters-connect:\n      hosts:\n        rke2-master-node02:\n        rke2-master-node03:" >> /etc/ansible/hosts;


echo -e "    workers:\n      hosts:" >> /etc/ansible/hosts
read -p "input worker ip : " WOK_IP
WOK_IP="${WOK_IP// /}"
IFS=',' read -ra WOK_IP_ARRAY <<< "$WOK_IP"
n="1"
for IP in "${WOK_IP_ARRAY[@]}";
  do echo -e "$IP rke2-worker-node0${n}" >> /etc/hosts;
  echo -e "        rke2-worker-node0${n}:" >> /etc/ansible/hosts;
  ((n+=1))
done

read -p "input dbnode ip : " DB_IP
DB_IP="${DB_IP// /}"
IFS=',' read -ra DB_IP_ARRAY <<< "$DB_IP"
n="1"
for IP in "${DB_IP_ARRAY[@]}";
  do echo -e "$IP rke2-db-node0${n}" >> /etc/hosts;
  echo -e "        rke2-db-node0${n}:" >> /etc/ansible/hosts;
  ((n+=1))
done