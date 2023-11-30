#!/usr/bin/bash

for i in {1..6};do ssh root@192.168.56.16$i mkdir /root/.ssh/;done
for i in {1..6};do scp /root/.ssh/id_rsa.pub root@192.168.56.16$i:/root/.ssh/authorized_keys;done