# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # jenkins server
  config.vm.define "Srv-Jenkins" do |jenkins|
    jenkins.vm.box = "generic/ubuntu2004"
    jenkins.vm.hostname = "jenkins-pipeline"
    jenkins.vm.box_url = "generic/ubuntu2004"
    jenkins.vm.network :private_network, ip: "192.168.200.200"
    jenkins.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--name", "Srv-Jenkins"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      service ssh restart
    SHELL
    jenkins.vm.provision "shell", path: "install_jenkins.sh"
  end

    # Ansible server
    config.vm.define "Srv-Ansible" do |jenkins|
      jenkins.vm.box = "generic/ubuntu2004"
      jenkins.vm.hostname = "generic/ubuntu2004"
      jenkins.vm.box_url = "generic/ubuntu2004"
      jenkins.vm.network :private_network, ip: "192.168.200.201"
      jenkins.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--name", "Srv-Ansible"]
        v.customize ["modifyvm", :id, "--cpus", "1"]
      end
      config.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        service ssh restart
      SHELL
      jenkins.vm.provision "shell", path: "install_ansible.sh"
    end


 # WebApp server
 config.vm.define "Srv-WebApp" do |jenkins|
  jenkins.vm.box = "generic/ubuntu2004"
  jenkins.vm.hostname = "generic/ubuntu2004"
  jenkins.vm.box_url = "generic/ubuntu2004"
  jenkins.vm.network :private_network, ip: "192.168.200.202"
  jenkins.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--memory", 3072]
    v.customize ["modifyvm", :id, "--name", "Srv-WebApp"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end
  config.vm.provision "shell", inline: <<-SHELL
    sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
    service ssh restart
  SHELL
end
end