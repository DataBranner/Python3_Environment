# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box_download_checksum_type = "sha256"
  config.vm.box_download_checksum = "818412bd6b40f9823eb4630c75e6d4c3e0b9d80c51d84a34f226aa61bc64bb93"

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
  end

  # Before provisioning with shell script, fix Ubuntu's refusal
  # to accept stdin as tty.
  # Following https://github.com/mitchellh/vagrant/issues/1673
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.provision "shell", path: "scripts/pip_and_python.sh"

end
