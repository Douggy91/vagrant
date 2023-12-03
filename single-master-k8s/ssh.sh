#!/usr/bin/bash

printf "new1234!\nnew1234!\n" | passwd

sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
systemctl restart sshd

echo 'alias vi=vim' >> /etc/profile
echo "sudo su -" >> .bashrc

sudo mkdir /root/.ssh
sudo echo "\
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDLM3XpoZ1cUoce/Zlfpz0+RbZS+Q0zMEXFt5cAKat92xneQ1DR60k5+ewuF6VyfknCRD2YfndxqnPpfiHpo0wMvmcxuRIigDrE3aVpLXkuzcjUI3ieY0Vz/vXZaJIm/U+h6791BbWP2obKIAO0P3UoKzR5O04K1s8gH3c9t3nyHr3XBNNjMeDHN4yRadxRXsKnDYks09fjOWkjlxJIVLrXnyFHb2Hkzk6pwhzeQX+TN9Y0bU6Dk9TOZUgKcIpRv30ZMHgCc6Qd93Lz6b75VXo2WpcxeBYgf+B6TCqV5P0LBap1SCACxh8HKIntZNJjplku6kytEONMP9f4uGDJB58EtvMPyG01Y11Kv2MD3S2AxYY3jxdltAxwk2iw3qAgPs5BZUqK7ehHzBlsYQ2E61xHeDznu6FPkJ3V+PslKba4TuM3qZp8lLPQgFus+7ZtZ6L0mJBTQokje+EdeW+riB5tRH6++clo2HBqT4LTDh/czx1HuPzrl9vwiWEVya8r0nzdMs0sDFTyiNahE6PnM/9hX7PwvYiFjhM4p+ZZ7wkQsCQonXdgNJVisOueoTrLKW3XH487gD/YQ6DoedLULAHHXr4okSOHTNKJDDgU9n6wrLiCXWYWecZCS+hgirfdjDWUZRXxsxBmJ1do6EXPdPJ8Lmvvj33XEW7T8hbrjln53Q== root@osc-doug\
" > /root/.ssh/authorized_keys

echo -e "192.168.56.161 k8s-master" >> /etc/hosts
for i in {1..5};do nw=$((i+1));echo "192.168.56.16${nw} k8s-worker${i}" >> /etc/hosts;done

echo -e "nameserver 168.126.63.1\nnameserver 8.8.8.8" > /etc/resolv.conf
