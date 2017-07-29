# docker-rpikernel-builder
Dockerfile to build a kernel for the Raspberry Pi

Before starting, the user building the kernel inside the container may have a different uid than the user building the image. 

To build:

```
docker build -t electron-apper:latest  -f Dockerfile.amd64 .
```

#  --build-arg proxy="repository.e-flamingo.net:3142" --network ef-test


To run:

```
export LOCALDIR=/home/joel/localwork

docker run --rm=true  --name electron-apper.run --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.XIM-unix:/tmp/.XIM-unix \
  -v /tmp/.font-unix:/tmp/.font-unix -v /tmp/.ICE-unix:/tmp/.ICE-unix \
  -v $LOCALDIR:/home/builder/localwork/ \
  -e DISPLAY=$DISPLAY \
  -it electron-apper:latest /bin/bash

sudo su builder
cd $HOME/localwork

```

The above command will deposit the deb packages in the current directory.
