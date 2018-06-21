#!/usr/bin/env bash
# auther: ge2x3k2@gmail.com
set -x

REGISTRY=${1:-local/}
SYSTEM='centos7.2.1511'
SERVICES=('php7.1_openresty' 'fis3')

docker build -t ${REGISTRY}${SYSTEM} docker/system/${SYSTEM}/

for SERVICE in ${SERVICES[*]}
do
    sed "s#SYSTEM_DOCKER_IMAGE#${REGISTRY}${SYSTEM}#" docker/service/${SERVICE}/Dockerfile.temp > docker/service/${SERVICE}/Dockerfile

    docker build -t ${REGISTRY}${SERVICE} docker/service/${SERVICE}/

    rm -rf docker/service/${SERVICE}/Dockerfile
done
