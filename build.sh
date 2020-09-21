#!/bin/sh -ex

# Download kernel and headers
KERNEL_VERSION=$(uname -r)
#export KERNEL_SOURCE_ROOT=/lib/modules/${KERNEL_VERSION}/build


apt -qyy install \
	linux-image-${KERNEL_VERSION}  \
	linux-headers-${KERNEL_VERSION} \
	pciutils \
	wget \
	pkg-config \
	libudev-dev

VERSION=1.7.l.4.10.0-00014
wget https://01.org/sites/default/files/downloads/qat$VERSION.tar.gz -O qat$VERSION.tar.gz
mkdir intel-qat
tar xvf qat$VERSION.tar.gz -C intel-qat
chown -R root:root  intel-qat
cd intel-qat
patch -p1 < ../patch/0001-pci_aer.patch
patch -p1 < ../patch/0001-timespec.patch
patch -p1 < ../patch/0001-cryptohash.patch
./configure --enable-kapi
make
#cp pcm*.x ..
