#!/usr/bin/bash

kubeadm init --apiserver-advertise-address=192.168.56.161 \
--pod-network-cidr=172.16.0.0/16 --token 123456.1234567890123456 --token-ttl 0
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config