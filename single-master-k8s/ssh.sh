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

echo -e "192.168.31.161 k8s-master" >> /etc/hosts
for i in {1..5};do nw=$((i+1));echo "192.168.31.16${nw} k8s-worker${i}" >> /etc/hosts;done

echo -e "nameserver 168.126.63.1\nnameserver 8.8.8.8" > /etc/resolv.conf
