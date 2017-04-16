# docker-rpikernel-builder
Dockerfile to build a kernel for the Raspberry Pi

Before starting, the user building the kernel inside the container may have a different uid than the user building the image. 

To build:

```
docker build -t electron-apper:latest  --build-arg proxy="repository.e-flamingo.net:3142" --network ef-test -f Dockerfile.amd64 .
```


To run:

```
docker run --rm=true  --network ef-test --name electron-apper.run --privileged -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket -v /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.XIM-unix:/tmp/.XIM-unix -v /tmp/.font-unix:/tmp/.font-unix -v /tmp/.ICE-unix:/tmp/.ICE-unix -e DISPLAY=$DISPLAY -v $HOME/localwork:/home/builder/localwork/ -it electron-apper:latest /bin/bash


```

The above command will deposit the deb packages in the current directory.
