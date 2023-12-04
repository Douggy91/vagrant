#!/usr/bin/bash

printf "new1234!\nnew1234!\n" | passwd

sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
systemctl restart sshd

echo 'alias vi=vim' >> /etc/profile
echo "sudo su -" >> .bashrc

sudo mkdir /root/.ssh
SSH_KEY=`cat /root/.ssh/id_rsa.pub`
sudo echo "\
${SSH_KEY}
" > /root/.ssh/authorized_keys


echo -e "192.168.31.161 rke2-master" > /etc/hosts
for i in {1..5};do nw=$((i+1));echo "192.168.31.16${nw} rke2-worker${i}" >> /etc/hosts;done

if [ ! -d "/etc/ansible/" ]; then
  mkdir -p /etc/ansible
else
  echo "ansible directory exists."
fi

echo -e "\
[AnsibleGroups]\n\
" > /etc/ansible/hosts
for i in {1..5};do echo "192.168.31.16${i} ansible_user=root";done >> /etc/ansible/hosts


echo -e "nameserver 168.126.63.1\nnameserver 8.8.8.8" > /etc/resolv.conf