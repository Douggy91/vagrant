#!/usr/bin/bash

printf "new1234!\nnew1234!\n" | passwd

sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
systemctl restart sshd

echo 'alias vi=vim' >> /etc/profile
echo "sudo su -" >> .bashrc

sudo mkdir /root/.ssh
sudo echo "\
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAGyqXvGQcHM6D8AKyuPT5rb6qBKtqXBtNO7bX9p9b9a6DAVOSyjW8VFcG45cM3thTxbz7qLUVyrEm23OVAddyO3ZK0Ljw7d7Pt2Go5u3VuCWn0l7k85PU7+wZyG57x+0z6B5WY5X6qWjyahFkFEmFxdM8YfyE6mrSJkuK10SCoVKwE+XM7B1fv6AXOk6JAT7/ZdRduic4ofqsceTu2ted5uo4MWzDuvd58tluMnctUJ3S9EbWrZR3oDvElIyIfwrqPcIRav56pwrWnmac/B8oQsk/VswNUsDNVEYT8XZ+EZXb8gFSig6NjiOiUliPxSR1Ppyfj29pZXg+P+k+3mdXKomSTFX3U/WVSi7qST77HQHOTTltV0lr57fp2Bo/iR6rBUd07rCSaqez8ocd7ZXzssb7CE7PiaGyFKpGfiRFC0LuhoUEmT9DRf5ClpgnzG6wmIBeBXEBV/0Xdkr0wx903l9LDd21TWKX6YibdgHOfKo/eh86d6Rihg2SSTNe5Ob2x/ymzAEkgYjOC5xDN/E57/hB5LD2Ft+GXgeUx6hlZVqvoh5uLFoKP8XqVAJB9W+lHbHM6HXF3hKLug75n031+RvUkFk4zvFUYfsRDIK3mtS1TEXKZc/UoA6dcAJhAmn41IedhhcyjPazoiuqXMgP3pJy0gm8Ip+cuT9zkUfR2Q== root@osc-doug\
" > /root/.ssh/authorized_keys

echo -e "192.168.31.161 k8s-master" >> /etc/hosts
for i in {1..5};do nw=$((i+1));echo "192.168.31.16${nw} k8s-worker${i}" >> /etc/hosts;done

echo -e "nameserver 168.126.63.1\nnameserver 8.8.8.8" > /etc/resolv.conf
