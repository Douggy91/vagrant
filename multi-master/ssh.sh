#!/usr/bin/bash

printf "new1234!\nnew1234!\n" | passwd

sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
systemctl restart sshd

echo 'alias vi=vim' >> /etc/profile
echo "sudo su -" >> .bashrc

for i in {1..3};do echo "192.168.56.16${i} k8s-master${i}" >> /etc/hosts;done
for i in {1..3};do nw=$((i+3));echo "192.168.56.16${nw} k8s-worker${i}" >> /etc/hosts;done

echo -e "nameserver 168.126.63.1\nnameserver 8.8.8.8" > /etc/resolv.conf