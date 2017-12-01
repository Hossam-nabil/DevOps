Vagrant.configure("2") do |config|
  config.vm.provision "docker"
  #  Box, Select any box created for VMware that is compatible with
  #    the ovftool.  To get maximum compatiblity You should download
  #    and install the latest version for your OS.
  #    https://www.vmware.com/support/developer/ovf/
  #
  #    If your box is stuck at "Powered On", then most likely
  #    the system doesn't have the vmware tools installed.
  #
  # Here are some of the MANY examples....
  #config.vm.box = 'ubuntu/trusty64'
  #config.vm.box = 'steveant/CentOS-7.0-1406-Minimal-x64'
  config.vm.box = 'geerlingguy/ubuntu1604'
  #config.vm.box = 'laravel/homestead'
  #config.vm.box = 'bento/ubuntu-14.04'
  #config.vm.box = 'generic/centos7'
  #config.vm.box = 'generic/fedora26'
  #config.vm.box = 'generic/alpine36'


  #  Supports type rsync and NFS.
  config.vm.synced_folder('.', '/Vagrantfiles', type: 'rsync')

  #
  #  Provider (esxi) settings
  #
  config.vm.provider :vmware_esxi do |esxi|

    #  REQUIRED!  ESXi hostname/IP
    #    You MUST specify a esxi_hostname or IP, uless you
    #    were lucky enough to name your esxi host "esxi".  :-)
    esxi.esxi_hostname = "192.168.9.10"

    #  ESXi username
    #    Default is "root".
    esxi.esxi_username = "docker"

    #
    #  A NOTE about esxi_password / ssh keys!!
    #
    #    If you don't specify a password and do not use ssh
    #    keys, you will be entering your esxi password A LOT!
    #
    #    From your command line, you should be able to run
    #    following command without an error and be able to get to
    #    the esxi command prompt.
    #
    #      $ ssh root@ESXi_IP_ADDRESS

    #  IMPORTANT!  ESXi password.
    #    The ssh connections to esxi will try your ssh
    #    keys first.  However the ovftool does NOT!  To make
    #    vagrant up fully password-less, you will need to
    #    enter your password here....
    esxi.esxi_password = "Pa!!w0rd"

    #  ESXi ssh keys
    #    The Default is to use system defaults, However
    #    you can specify an array of keys here...
    #esxi.esxi_private_keys = []

    #  SSH port.
    #    Default port 22
    #esxi.esxi_hostport = 22

    #  HIGHLY RECOMMENDED!  Virtual Network
    #    You should specify a Virtual Network!
    #    The default is to use the first found!
    esxi.virtual_network = "User-Network"

    #  OPTIONAL.  Specify a Disk Store
    #    The Default is to use the least used Disk Store.
    esxi.vm_disk_store = "Esx1-LocalDatastore"

    #  OPTIONAL.  Guest VM name to be created/used.
    #    The Default will be automatically generated
    #    and will be based on the vmname_prefix,
    #    hostname, username, path...
    #esxi.vmname = "Custom-Guest-VM_Name"

    #  OPTIONAL.  When automatically naming VMs, use
    #    this prifix.
    #esxi.vmname_prefix = "V-"

    #  OPTIONAL.  Memory size override
    #    The default is to use the memory size specified in the
    #    vmx file, however you can specify a new value here.
    #esxi.memsize = "2048"

    #  OPTIONAL.  Virtual CPUs override
    #    The default is to use the number of virt cpus specified
    #     in the vmx file, however you can specify a new value here.
    #esxi.numvcpus = "2"

    #  OPTIONAL.  Resource Pool
    #    The default is to create VMs in the "root".  You can
    #     specify a resource pool here to partition memory and
    #     cpu usage away from other systems on your esxi host.
    #     The resource pool must already exist and be configured.
    #     Vagrant will NOT create it for you.
    #esxi.resource_pool = "/Vagrant"

    #  DANGEROUS!  Allow Overwrite
    #    Set this to 'True' will overwrite existing VMs (with the same name)
    #    when you run vagrant up.   ie,  if the vmname already exists,
    #    it will be destroyed, then over written...  This is helpful
    #    if you have a VM that became an orphan (vagrant lost association).
    #    This will also overwrite your box when using vagrant package.
    #esxi.allow_overwrite = 'True'
  end
    config.hostmanager.enabled = true
    config.hostmanager.manage_guest = true
    config.hostmanager.manage_host = false
    config.hostmanager.include_offline = false
    config.hostmanager.ignore_private_ip = true
end
