Vagrant.configure("2") do |config|
    (1..3).each do |i|
      config.vm.define "k8s-master#{i}" do |cfg|
        cfg.vm.box = "generic/ubuntu2004"
          cfg.vm.provider "virtualbox" do |vbox|
          vbox.name = "k8s-master#{i}"
              vbox.cpus = 4
              vbox.memory = 16384
          end
          cfg.vm.host_name = "k8s-master#{i}"
          cfg.vm.network "private_network", ip: "192.168.56.16#{i}"
          cfg.vm.network "forwarded_port", guest: 22, host: "3002#{i}", auto_correct: true, id: "ssh", host_ip:"0.0.0.0"
          cfg.vm.synced_folder ".", "/vagrant", disabled: true
          cfg.vm.provision "shell", path: "ssh.sh"
          cfg.vm.provision "shell", path: "crio.sh"
          cfg.vm.provision "shell", path: "k8s.sh"
        end
    end
    (4..6).each do |i|
        config.vm.define "k8s-worker#{i}" do |cfg|
          cfg.vm.box = "generic/ubuntu2004"
            cfg.vm.provider "virtualbox" do |vbox|
            vbox.name = "k8s-worker#{i}"
                vbox.cpus = 2
                vbox.memory = 16384
            end
            cfg.vm.host_name = "k8s-worker#{i}"
            cfg.vm.network "private_network", ip: "192.168.56.16#{i}"
            cfg.vm.network "forwarded_port", guest: 22, host: "3002#{i}", auto_correct: true, id: "ssh", host_ip:"0.0.0.0"
            cfg.vm.synced_folder ".", "/vagrant", disabled: true
            cfg.vm.provision "shell", path: "ssh.sh"
            cfg.vm.provision "shell", path: "crio.sh"
            cfg.vm.provision "shell", path: "k8s.sh"
          end
      end
    end