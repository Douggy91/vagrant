#!/bin/bash

echo -e "127.0.0.1       localhost
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
      do echo -e "$IP rke2-master-node${n}" >> /etc/hosts;
      echo -e "rke2-master-node${n}" >> /etc/ansible/hosts;
      ((n+=1))
      done
    read -p "input bastion ip : " BAS_IP
    echo "$BAS_IP rke2-bastion-node1" >> /etc/hosts;
    echo "rke2-bastion-node1" >> /etc/ansible/hosts;
    ;;
  "n")
    read -r "plese input controlplane ip : " CON_IP
    echo "$CON_IP rke2-master-node1" > /etc/hosts;
    echo "rke2-master-node1" >> /etc/ansible/hosts;
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
  do echo -e "$IP rke2-worker-node${n}" >> /etc/hosts;
  echo -e "rke2-worker-node${n}" >> /etc/ansible/hosts;
  ((n+=1))
done

read -p "input dbnode ip : " DB_IP
DB_IP="${DB_IP// /}"
IFS=',' read -ra DB_IP_ARRAY <<< "$DB_IP"
n="1"
for IP in "${DB_IP_ARRAY[@]}";
  do echo "$IP rke2-db-node${n}" >> /etc/hosts;
  echo "rke2-db-node${n}" >> /etc/ansible/hosts;
  ((n+=1))
done
