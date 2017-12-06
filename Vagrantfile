nodes = [
  { hostname: 'swarm-manager1', network: 'User-Network', box: 'geerlingguy/ubuntu1604' },
  { hostname: 'swarm-worker1', network: 'User-Network', box: 'geerlingguy/ubuntu1604' },
  { hostname: 'swarm-worker2', network: 'User-Network', box: 'geerlingguy/ubuntu1604' }
]

Vagrant.configure("2") do |config|
	config.hostmanager.enabled = true
	config.hostmanager.manage_guest = true
	config.hostmanager.manage_host = true
	config.hostmanager.include_offline = false
	config.hostmanager.ignore_private_ip = true

	config.vm.define :ansible do |ansible_config|
		ansible_config.vm.box = "geerlingguy/ubuntu1604"
		ansible_config.vm.hostname = "ansible"
		ansible_config.vm.synced_folder('.', '/Vagrantfiles', type: 'rsync', disabled: true)
		ansible_config.vm.provision :shell, path: "bootstrap-ansible.sh"
	end

	nodes.each do |node|
		config.vm.define node[:hostname] do |node_config|
			node_config.vm.provision "docker"
			node_config.vm.hostname = node[:hostname]
			node_config.vm.box = node[:box]
			node_config.vm.synced_folder('.', '/Vagrantfiles', type: 'rsync', disabled: true)
		end
	end

	config.vm.provider :vmware_esxi do |esxi|
		esxi.esxi_hostname = "192.168.9.10"
		esxi.esxi_username = "docker"
		esxi.esxi_password = "Pa!!w0rd"
		esxi.virtual_network = "User-Network"
		esxi.vm_disk_store = "Esx1-LocalDatastore"
		#esxi.vmname = node[:hostname]
		#esxi.esxi_private_keys = []
		#esxi.esxi_hostport = 22

		#esxi.vmname_prefix = "V-"
		#esxi.memsize = "2048"
		#esxi.numvcpus = "2"
		#esxi.resource_pool = "/Vagrant"
		#esxi.allow_overwrite = 'True'
	end
end
