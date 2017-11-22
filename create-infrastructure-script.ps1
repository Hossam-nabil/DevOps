
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
