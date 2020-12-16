IMAGE_NAME = "bento/ubuntu-20.04"

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 4
  end

  # Cluster Master
  config.vm.define "k8s-master" do |master|
    master.vm.box = IMAGE_NAME
    master.vm.network "private_network", ip: "192.168.10.10"
    master.vm.network "forwarded_port", guest: 8080, host:3000
    master.vm.hostname = "k8s-master"
    master.vm.provision "shell", path: "video-service-slice/kubernetes-setup/setup-docker.sh"
    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "video-service-slice/kubernetes-setup/master-playbook.yml"
      ansible.extra_vars = {
        node_ip: "192.168.10.10",
      }
    end
    master.vm.provision "shell", path: "video-service-slice/kubernetes-setup/setup-iptables.sh"
  end

  # Worker 1
  config.vm.define "k8s-worker-1" do |node|
    node.vm.box = IMAGE_NAME
    node.vm.network "private_network", ip: "192.168.10.20"
    node.vm.hostname = "k8s-worker-1"
    node.vm.provision "shell", path: "video-service-slice/kubernetes-setup/setup-docker.sh"
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "video-service-slice/kubernetes-setup/node-playbook.yml"
      ansible.extra_vars = {
        node_ip: "192.168.10.20",
      }
    end
    node.vm.provision "shell", path: "video-service-slice/kubernetes-setup/setup-iptables.sh"
  end

  # Worker 2
  config.vm.define "k8s-worker-2" do |node|
    node.vm.box = IMAGE_NAME
    node.vm.network "private_network", ip: "192.168.10.30"
    node.vm.hostname = "k8s-worker-2"
    node.vm.provision "shell", path: "video-service-slice/kubernetes-setup/setup-docker.sh"
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "video-service-slice/kubernetes-setup/node-playbook.yml"
      ansible.extra_vars = {
        node_ip: "192.168.10.30",
      }
    end
    node.vm.provision "shell", path: "video-service-slice/kubernetes-setup/setup-iptables.sh"
  end
end