# Docker Image with tools for deploying code

Based in Alpine, this image contains the binaries for:

* [ESSH](https://github.com/kohkimakimoto/essh)
Automatize ssh connections and tasks using lua

* [AWLESS](https://github.com/wallix/awless)
Light client for AWS SDK in binary, few space with good functionality

* [MYAWS](https://github.com/minamijoyo/myaws)
Other light client for AWS SDK in binary, good functionality

* [CAPZE](https://github.com/yuuki/capze)
Creates and automatize move code following the [Capistrano](https://capistranorb.com/) folder structure

* [STEW](https://github.com/marwanhawari/stew)
Install easily binaries from github releases

## Tasks

### build

Build image

```
export RELEASE=$(date +%Y%m%d%H%M)
docker build -t digiosysops/deploy-tools:$RELEASE -t digiosysops/deploy-tools:latest .
```

### push

Push image to dockerhub

```
LAST_IMAGE=$(docker images --format "{{.Repository}}:{{.Tag}}" | grep "digiosysops/deploy-tools:" | grep -v "latest" | sort -r | head -n 1)
docker push $LAST_IMAGE
docker push digiosysops/deploy-tools:latest
```

### clean

Remove all images with tag  digiosysops/deploy-tools:tag

```
docker rmi $(docker images --format "{{.Repository}}:{{.Tag}}" | grep "digiosysops/deploy-tools:" | sort -r)
```
