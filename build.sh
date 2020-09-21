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
VERSION=1.7.l.4.11.0-00001
wget https://01.org/sites/default/files/downloads/qat$VERSION.tar.gz -O qat$VERSION.tar.gz
mkdir qat-$VERSION
tar xvf qat$VERSION.tar.gz -C qat-$VERSION
chown -R root:root  qat-$VERSION
cd qat-$VERSION
git apply patch/0001-pci_aer.patch
./configure --enable-kapi
make
#cp pcm*.x ..
