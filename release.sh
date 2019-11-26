#!/bin/sh
docker_port=81
host_port=8082
name="bizmet"
deploy_repo="vinay886"
tag="latest"

bash security_check.sh 
#sudo docker build -t bizmet:latest .
docker build -t ${name}/${tag} .
docker stop ${name} || echo "stopped"
docker rm ${name} || echo "deleted"
docker run -d -p ${host_port}:${docker_port} --name=${name} --restart unless-stopped ${name}/${tag}
#test
sleep 5
if curl -I http://localhost:${host_port}/hello | grep 200;
then
    if grep "\"auth\":" ~/.docker/config.json;
    then
        docker tag ${name}/${tag} ${deploy_repo}/${name}:${tag}
        docker push ${deploy_repo}/${name}:${tag}
    else
        echo "pls login and push the content"
        exit 1
    fi
else
    echo "container not working"
    exit 1
fi
