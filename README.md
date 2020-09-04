# multi-arch-test

## Steps

```shell
export PAT=$(pbpaste)
echo "$PAT" | docker login -u $USER https://ghcr.io --password-stdin

docker buildx create --name multi-arch --use --driver docker-container

docker buildx inspect --bootstrap
docker buildx ls

NAME/NODE     DRIVER/ENDPOINT             STATUS  PLATFORMS
multi-arch *  docker-container
  multi-arch0 unix:///var/run/docker.sock running linux/amd64, linux/arm64, linux/ppc64le, linux/s390x, linux/386, linux/arm/v7, linux/arm/v6

git clone git@github.com:president-business-corp/multi-arch-test.git
cd multi-arch-test

docker buildx build --platform linux/arm/v7,linux/amd64 --tag ghcr.io/president-business-corp/test/multi-arch:latest --push -f Dockerfile .
```

## Multi-Arch Container

https://github.com/orgs/president-business-corp/packages/container/test%2Fmulti-arch/
