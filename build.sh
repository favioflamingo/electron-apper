#!/bin/bash

set -e

# https://github.com/raspberrypi/linux/tree/rpi-4.4.y

APPENDNAME=$1

if [ -z ${APPENDNAME+x} ]; then
	echo "Going WITHOUT an apt proxy" 1>&2;
	APPENDNAME="custom" 	
fi

echo "Setting name of build to ${APPENDNAME}" 1>&2

cd /tmp/linux

#git fetch origin

#git checkout ${TARGETBRANCH}

cp /src/config.txt ./.config

DEB_HOST_ARCH=armhf

make-kpkg --rootcmd fakeroot --arch arm --cross-compile arm-linux-gnueabihf- \
 --append-to-version=-${APPENDNAME} kernel_image kernel_headers kernel_source

cd ..

mkdir /tmp/packages

cp *.deb /tmp/packages/
