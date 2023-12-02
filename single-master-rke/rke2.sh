#!/usr/bin/bash

swapoff -a

cat <<EOF | sudo tee /etc/modules-load.d/crio.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system

apt-get upgrade -y 
apt-get dist-upgrade -y 
apt-get update -y
apt install -y open-iscsi nfs-common iptables
systemctl stop ufw && ufw disable && iptables -F

case $HOSTNAME in
  *master*)
    export NTYPE="server";
    ;;
  *worker*)
    export NTYPE="agent"
    ;;
esac

curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE=${NTYPE} sh -
mkdir -p /etc/rancher/rke2