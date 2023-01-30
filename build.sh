#!/bin/sh -ex

# Download kernel and headers
ifndef KVERS
KVERS=$(shell uname -r)
endif

ifndef KSRC
export KERNEL_SOURCE_ROOT=/lib/modules/${KVERS}/build
else
export KERNEL_SOURCE_ROOT=${KSRC}
endif


apt -qyy install \
	pciutils \
	yasm \
	wget \
	pkg-config \
	libboost-all-dev \
	libudev-dev

# VERSION=1.7.l.4.10.0-00014
# wget https://01.org/sites/default/files/downloads/qat$VERSION.tar.gz -O qat$VERSION.tar.gz
mkdir intel-qat
tar xvf QAT.L.4.20.0-00001.tar.gz -C intel-qat
chown -R root:root  intel-qat
cd intel-qat
./configure --enable-kapi
make
