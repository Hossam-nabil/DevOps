# DevOps

### Development Environment Setup

1. Vagrant
2. Packer

### Configuration management tools: https://www.intigua.com/blog/puppet-vs.-chef-vs.-ansible-vs.-saltstack

1.	Puppet 
2.	Salt 
3.	Chef 
4.	Ansible

### Orchestration: https://blog.gruntwork.io/why-we-use-terraform-and-not-chef-puppet-ansible-saltstack-or-cloudformation-7989dad2865c

1. ColudFormation
2. Terraform

### Container Orchestration Tools

1. Nomad
2. Hadoop
3. Terraform
4. Swarm
5. Kubernetes
6. Mesos + Mesosphere
7. AWS ECS
8. Azure Stack

https://docs.docker.com/engine/swarm/stack-deploy/

https://blog.nimbleci.com/2016/09/14/docker-stacks-and-why-we-need-them/

https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/swarm-mode

https://www.safaribooksonline.com/library/view/ansible-2-for/9781786465719/video1_4.html


# Service Discovery

### Slides:

[Docker Service Registration and Discovery](https://www.slideshare.net/m_richardson/docker-service-registration-and-discovery?next_slideshow=1)

[Docker cluster with swarm, consul, registrator and consul-template](https://www.slideshare.net/JulienMaitrehenry/swarm-49613398)

# Docker:

### Posts:

[Docker in Production: A History of Failure](https://thehftguy.com/2016/11/01/docker-in-production-an-history-of-failure/)


# Docker Terms:

1. Docker Machine
2. Docker Engine
3. Docker Swarm
4. Docker Compose
5. Docker Daemon
6. Docker CLI
7. Docker Stack

# Docker Swam:

1. Cluster
2. Node
3. Manager/Worker
4. Service
5. SwamKit
6. Routing Mesh
7. Raft Consensus Algorithm
8. Service Discovery
9. Load Balancing

# Docker Swarm

[Comparing Swarm, Swarmkit and Swarm Mode](https://sreeninet.wordpress.com/2016/07/14/comparing-swarm-swarmkit-and-swarm-mode/)

	TCP port 2377 for cluster management communications
	TCP and UDP port 7946 for communication among nodes
	UDP port 4789 for overlay network traffic

### [Networks](https://docs.docker.com/engine/swarm/networking/):

A Docker swarm generates two different kinds of traffic:

 - **Control and management plane traffic:** This includes swarm management messages, such as requests to join or leave the swarm. This   traffic is always encrypted.
 - **Application data plane traffic:** This includes container traffic and traffic to and from external clients.
 
 The following three network concepts are important to swarm services:
 
 - **Overlay networks** manage communications among the Docker daemons participating in the swarm. You can create overlay networks, in the same way as user-defined networks for standalone containers.
 - **The ingress network** is a special overlay network that facilitates load balancing among a service’s nodes. 
 - **The docker_gwbridge** is a bridge network that connects the overlay networks (including the ingress network) to an individual Docker daemon’s physical network.
 
### [Docker Registry](https://docs.docker.com/registry/):

Create or modify `/etc/docker/daemon.json`

	{ "insecure-registries":["<local-registry-ip>:5000"] }
	
Restart docker daemon

	sudo service docker restart

```
docker service create `
  --detach=false `
  --name=registry `
  --publish=2727:5000 `
  --constraint=node.role==manager `
  --mount=type=bind,src=/mnt/registry,dst=/var/lib/registry `
  registry:2
```

### Tutorials:

[Docker and Swarm Mode – Part 1](https://lostechies.com/gabrielschenker/2016/09/05/docker-and-swarm-mode-part-1/)
	
# CLI:

```
docker swarm promote/demote nodename
docker node update --vailability drain/pause/active nodename
```	
### Swarm Init
```

docker-machine create --driver vmwarevsphere `
     --vmwarevsphere-vcenter 192.168.9.10 `
     --vmwarevsphere-datastore Esx1-LocalDatastore `
     --vmwarevsphere-network User-Network `
     --vmwarevsphere-username=docker `
     --vmwarevsphere-password=Pa!!w0rd `
     manager1

For ($i=1; $i -le 2; $i++){
    docker-machine create --driver vmwarevsphere `
         --vmwarevsphere-vcenter 192.168.9.10 `
         --vmwarevsphere-datastore Esx1-LocalDatastore `
         --vmwarevsphere-network User-Network `
         --vmwarevsphere-username=docker `
         --vmwarevsphere-password=Pa!!w0rd `
         worker$i
}



& "C:\Program Files\Docker\Docker\Resources\bin\docker-machine.exe" env manager1 | Invoke-Expression


$manager_ip = docker-machine ip manager1
docker swarm init --advertise-addr $manager_ip 


$worker_joion_token = docker swarm join-token -q worker
For ($i=1; $i -le 2; $i++){
    $worker_ip = docker-machine ip worker$i
    docker-machine ssh worker$i "docker swarm join --token $worker_joion_token --advertise-addr $worker_ip ${manager_ip}:2377"
}


docker service create `
  --name=visualizer `
  --publish=8080:8080/tcp `
  --constraint=node.role==manager `
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock `
  dockersamples/visualizer


docker service create `
  --detach=false `
  --name=registry `
  --publish=2727:5000 `
  --constraint=node.role==manager `
  --mount=type=bind,src=/mnt/registry,dst=/var/lib/registry `
  registry:2
```

### Create Docker Machine on ESXi
```
docker-machine create --driver vmwarevsphere `
     --vmwarevsphere-vcenter <ip> `
     --vmwarevsphere-datastore Esx1-LocalDatastore `
     --vmwarevsphere-network User-Network `
     --vmwarevsphere-username=docker `
     --vmwarevsphere-password=**** `
     manager1
```

# Networking:

https://success.docker.com/article/Docker_Reference_Architecture-_Designing_Scalable,_Portable_Docker_Container_Networks

# Service Discovery:

https://dzone.com/articles/fast-development-workflow-with-docker-and-kubernet

http://blog.arungupta.me/docker-swarm-cluster-using-consul/

https://blog.docker.com/2015/02/orchestrating-docker-with-machine-swarm-and-compose/


# Docker Host

https://www.safaribooksonline.com/library/view/docker-compose-in/100000006A0437/000601.html

https://www.safaribooksonline.com/library/view/restful-web-services/9781788294638/video4_7.html

https://www.safaribooksonline.com/library/view/event-driven-microservices/9781491944165/video239923.html

https://docs.microsoft.com/en-us/vsts/build-release/concepts/definitions/build/variables?tabs=powershell

https://blogs.msdn.microsoft.com/jcorioland/2016/08/19/build-push-and-run-docker-images-with-visual-studio-team-services/

https://github.com/Microsoft/VSTS-Docker-Preview

https://marketplace.visualstudio.com/items?itemName=ms-vscs-rm.docker

# Release

https://fluentbytes.com/using-docker-on-windows-in-vsts-build-and-release-management/

https://blogs.msdn.microsoft.com/devops/2017/06/09/deploying-applications-to-azure-container-service/

# Swarm vs kubernetes

https://platform9.com/blog/compare-kubernetes-vs-docker-swarm/

https://platform9.com/blog/kubernetes-docker-swarm-compared/

https://www.upcloud.com/blog/docker-swarm-vs-kubernetes/

# Course:

https://www.safaribooksonline.com/library/view/building-microservice-systems/9781771375917/video258305.html


# Consul

1. https://www.mauras.ch/securing-consul.html
2. http://jovandeginste.github.io/2016/05/04/turning-on-acl-s-in-our-consul-cluster.html
3. https://hub.docker.com/_/consul/
4. https://www.consul.io/docs/agent/options.html#configuration_files
5. https://www.consul.io/docs/guides/acl.html
6. https://www.consul.io/api/acl.html
7. https://github.com/PlayFab/consuldotnet
8. https://gist.github.com/slackpad/d89ce0e1cc0802c3c4f2d84932fa3234

https://werner-dijkerman.nl/2017/01/09/setting-up-a-secure-consul-cluster-with-docker/

# New Concepts:

gRPC - https://grpc.io/

Gossip - https://www.serf.io/docs/internals/gossip.html

Raft Consensus Algorithm - https://raft.github.io/

# Ansible:

https://www.safaribooksonline.com/library/view/ansible-2-for/9781786465719/video1_4.html

https://www.safaribooksonline.com/library/view/ansible-fundamentals-livelessons/9780134863870/anfu_00_01_03_00.html

https://github.com/jamesdmorgan/vagrant-ansible-docker-swarm

https://github.com/jweissig/episode-45/blob/master/Vagrantfile

### Swarm Playbooks

https://github.com/nextrevision/ansible-swarm-playbook

https://github.com/atosatto/ansible-dockerswarm/blob/master/tasks/swarm_cluster.yml

# Vagrant:

https://github.com/mitchellh/boot2docker-vagrant-box

https://github.com/geerlingguy/ansible-vagrant-examples

https://rjzaworski.com/2015/07/using-ansible-with-vagrant

# Blogs:

https://blog.scottlowe.org/archives/

# Tools:

https://www.sysdig.org/install/

https://portworx.com/products/features/

http://docker-sync.io/
