# multi-arch-test

https://github.com/orgs/president-business-corp/packages/container/package/test%2Fmulti-arch

## Initial Steps

### Initialize buildx

Create the driver

```shell
docker buildx create --name multi-arch --use --driver docker-container
```

Check the drive has been created
```shell
docker buildx inspect --bootstrap

Name:   multi-arch
Driver: docker-container

Nodes:
Name:      multi-arch0
Endpoint:  unix:///var/run/docker.sock
Status:    running
Platforms: linux/amd64, linux/arm64, linux/ppc64le, linux/s390x, linux/386, linux/arm/v7, linux/arm/v6
```

Double check for other drivers
```shell
docker buildx ls

NAME/NODE     DRIVER/ENDPOINT             STATUS  PLATFORMS
multi-arch *  docker-container
  multi-arch0 unix:///var/run/docker.sock running linux/amd64, linux/arm64, linux/ppc64le, linux/s390x, linux/386, linux/arm/v7, linux/arm/v6
```

### Login to GHCR

```shell
export PAT=$(pbpaste)
echo "$PAT" | docker login -u $USER https://ghcr.io --password-stdin
```

### Buildx build
```shell
git clone git@github.com:president-business-corp/multi-arch-test.git
cd multi-arch-test

docker buildx build --platform linux/arm/v7,linux/amd64 --tag ghcr.io/president-business-corp/test/multi-arch:latest --push -f Dockerfile .
```

## Multi-Arch Container

https://github.com/orgs/president-business-corp/packages/container/package/test%2Fmulti-arch
