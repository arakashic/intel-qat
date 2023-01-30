#!/bin/sh -ex

# Download kernel and headers
KERNEL_VERSION=$(uname -r)
#export KERNEL_SOURCE_ROOT=/lib/modules/${KERNEL_VERSION}/build


apt -qyy install \
	pciutils \
	yasm \
	wget \
	pkg-config \
	libboost-all-dev \
	libudev-dev
apt-get source linux-image-$KERNEL_VERSION

# VERSION=1.7.l.4.10.0-00014
# wget https://01.org/sites/default/files/downloads/qat$VERSION.tar.gz -O qat$VERSION.tar.gz
mkdir intel-qat
tar xvf QAT.L.4.20.0-00001.tar.gz -C intel-qat
chown -R root:root  intel-qat
cd intel-qat
./configure --enable-kapi
make
