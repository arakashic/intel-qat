#!/bin/sh -ex

# Download kernel and headers
# ifndef KVERS
# KVERS=$(shell uname -r)
# endif

# ifndef KSRC
# export KERNEL_SOURCE_ROOT=/lib/modules/${KVERS}/build
# else
# apt info linux-headers-truenas-amd64
# export KVERS=$(apt info linux-headers-truenas-amd64 | awk '/Source:/ { print $2}' | sed 's/linux-//')
# export KSRC="/usr/src/linux-headers-${KVERS}"
# export KERNEL_SOURCE_ROOT=${KSRC}
# export KERNEL_SOURCE_ROOT=/lib/modules/5.10.0-18-amd64/build
export KERNEL_SOURCE_ROOT=/lib/modules/5.15.79+truenas/build
ls /usr/src/
ls /lib/modules/
# endif


apt -qyy install \
	pciutils \
	yasm \
	wget \
	pkg-config \
	libudev-dev

# VERSION=1.7.l.4.10.0-00014
# wget https://01.org/sites/default/files/downloads/qat$VERSION.tar.gz -O qat$VERSION.tar.gz
mkdir intel-qat
tar xvf QAT.L.4.20.0-00001.tar.gz -C intel-qat
chown -R root:root  intel-qat
cd intel-qat
./configure --enable-kapi --enable-icp-sriov=host
make
make install
