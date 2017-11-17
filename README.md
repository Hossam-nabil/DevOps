# DevOps

Development Environment Setup

1. Vagrant
2. Packer

Configuration management tools: https://www.intigua.com/blog/puppet-vs.-chef-vs.-ansible-vs.-saltstack

1.	Puppet 
2.	Salt 
3.	Chef 
4.	Ansible

Orchestration: https://blog.gruntwork.io/why-we-use-terraform-and-not-chef-puppet-ansible-saltstack-or-cloudformation-7989dad2865c

1. ColudFormation
2. Terraform

```
docker-machine create --driver vmwarevsphere `
     --vmwarevsphere-vcenter <ip> `
     --vmwarevsphere-datastore Esx1-LocalDatastore `
     --vmwarevsphere-network User-Network `
     --vmwarevsphere-username=docker `
     --vmwarevsphere-password=**** `
     manager1
```
     
https://docs.docker.com/engine/swarm/stack-deploy/

https://blog.nimbleci.com/2016/09/14/docker-stacks-and-why-we-need-them/

https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/swarm-mode


https://www.safaribooksonline.com/library/view/ansible-2-for/9781786465719/video1_4.html

# Service Discovery

Slides:

[Docker Service Registration and Discovery](https://www.slideshare.net/m_richardson/docker-service-registration-and-discovery?next_slideshow=1)

[Docker cluster with swarm, consul, registrator and consul-template](https://www.slideshare.net/JulienMaitrehenry/swarm-49613398)

# Terms

Docker Machine

Docker Engine

Docker Swarm

Docker Compose

Docker Daemon

Docker CLI

Docker Stack

# Docker Swarm

[Comparing Swarm, Swarmkit and Swarm Mode](https://sreeninet.wordpress.com/2016/07/14/comparing-swarm-swarmkit-and-swarm-mode/)

	TCP port 2377 for cluster management communications
	TCP and UDP port 7946 for communication among nodes
	UDP port 4789 for overlay network traffic

Swam:
	Cluster
	Node
	Manager/Worker
	Service
	SwamKit
	Routing Mesh
	Raft Consensus Algorithm
	Service Discovery
	Load Balancing
CLI:
	- docker swarm promote/demote nodename
	- docker node update --vailability drain/pause/active nodename

# Networking:

https://success.docker.com/article/Docker_Reference_Architecture-_Designing_Scalable,_Portable_Docker_Container_Networks

# Service Discovery:

https://dzone.com/articles/fast-development-workflow-with-docker-and-kubernet
http://blog.arungupta.me/docker-swarm-cluster-using-consul/



https://blog.docker.com/2015/02/orchestrating-docker-with-machine-swarm-and-compose/

1.	Machine
2.	Swarm
3.	Compose

Docker Host

https://www.safaribooksonline.com/library/view/docker-compose-in/100000006A0437/000601.html


https://www.safaribooksonline.com/library/view/restful-web-services/9781788294638/video4_7.html

https://www.safaribooksonline.com/library/view/event-driven-microservices/9781491944165/video239923.html


${source:-obj/Docker/publish}

/p:OutputPath=C:\mydir

https://docs.microsoft.com/en-us/vsts/build-release/concepts/definitions/build/variables?tabs=powershell

https://blogs.msdn.microsoft.com/jcorioland/2016/08/19/build-push-and-run-docker-images-with-visual-studio-team-services/

https://github.com/Microsoft/VSTS-Docker-Preview

https://marketplace.visualstudio.com/items?itemName=ms-vscs-rm.docker

Release

https://fluentbytes.com/using-docker-on-windows-in-vsts-build-and-release-management/

https://blogs.msdn.microsoft.com/devops/2017/06/09/deploying-applications-to-azure-container-service/

# Swarm vs kubernetes

https://platform9.com/blog/compare-kubernetes-vs-docker-swarm/

https://platform9.com/blog/kubernetes-docker-swarm-compared/

https://www.upcloud.com/blog/docker-swarm-vs-kubernetes/

# Course:

https://www.safaribooksonline.com/library/view/building-microservice-systems/9781771375917/video258305.html


Nomad

Hadoop

Terraform

Swarm

Kubernetes

Mesos

AWS ECS

Azure Stack

# Consul

1.	https://www.mauras.ch/securing-consul.html
2.	http://jovandeginste.github.io/2016/05/04/turning-on-acl-s-in-our-consul-cluster.html
3.	https://hub.docker.com/_/consul/
4.	https://www.consul.io/docs/agent/options.html#configuration_files
5.	https://www.consul.io/docs/guides/acl.html
6.	https://www.consul.io/api/acl.html
7.	https://github.com/PlayFab/consuldotnet
8.	https://gist.github.com/slackpad/d89ce0e1cc0802c3c4f2d84932fa3234

https://werner-dijkerman.nl/2017/01/09/setting-up-a-secure-consul-cluster-with-docker/


