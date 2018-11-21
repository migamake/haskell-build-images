#!/bin/sh

docker login --username=${DOCKER_USER} --password=${DOCKER_PASSWORD}

for GHC_VER in 7.8.4 7.10.3 8.0.2 8.2.2 8.4.4; do
  docker build . -f Dockerfile --build-arg GHC_VER=${GHC_VER} --tag migamake/haskell-build:${GHC_VER} &&
  docker push migamake/haskell-build:${GHC_VER};
done;
