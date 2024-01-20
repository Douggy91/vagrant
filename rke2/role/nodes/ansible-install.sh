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


rpm -Uvh /tmp/packages/ansible/git-core-2.39.3-1.el8_8.x86_64.rpm

ADT=$(ip addr | grep -w inet | cut -d ' ' -f 12 | egrep 'e.*0')
HOSTIP=$(ip addr | grep $ADT | grep inet |  awk 'NR==1 { print $2 }' | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
echo $HOSTIP

echo -e "127.0.0.1       localhost
$HOSTIP rke2-install-node
" > /etc/hosts
echo "[masters]" > /etc/ansible/hosts

read -p "if using multi controlplane, (y/n) : " multi_control_enable
case $multi_control_enable in
  "y")
    read -p "please input 3 controlplane ip : " CON_IP
    CON_IP="${CON_IP// /}"
    IFS=',' read -ra CON_IP_ARRAY <<< "$CON_IP"
    n="1"
    for IP in "${CON_IP_ARRAY[@]}";
      do echo -e "$IP rke2-master-node0${n}" >> /etc/hosts;
      echo -e "rke2-master-node0${n}" >> /etc/ansible/hosts;
      ((n+=1))
      done
    read -p "input control ip : " BAS_IP
    echo "[control]" >> /etc/ansible/hosts;
    echo "$BAS_IP rke2-control-node01" >> /etc/hosts;
    echo "rke2-control-node01" >> /etc/ansible/hosts;
    ;;
  "n")
    read -p "plese input controlplane ip : " CON_IP
    echo "$CON_IP rke2-master-node01" >> /etc/hosts;
    echo "rke2-master-node01" >> /etc/ansible/hosts;
    ;;
  *)
    echo "please right answer"
    ;;
esac


echo -e "\n[workers]" >> /etc/ansible/hosts
read -p "input worker ip : " WOK_IP
WOK_IP="${WOK_IP// /}"
IFS=',' read -ra WOK_IP_ARRAY <<< "$WOK_IP"
n="1"
for IP in "${WOK_IP_ARRAY[@]}";
  do echo -e "$IP rke2-worker-node0${n}" >> /etc/hosts;
  echo -e "rke2-worker-node0${n}" >> /etc/ansible/hosts;
  ((n+=1))
done

read -p "input dbnode ip : " DB_IP
DB_IP="${DB_IP// /}"
IFS=',' read -ra DB_IP_ARRAY <<< "$DB_IP"
n="1"
for IP in "${DB_IP_ARRAY[@]}";
  do echo "$IP rke2-db-node0${n}" >> /etc/hosts;
  echo "rke2-db-node0${n}" >> /etc/ansible/hosts;
  ((n+=1))
done