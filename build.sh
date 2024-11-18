#!/bin/sh -ex

export KVERS=$(apt info linux-headers-truenas-production-amd64 | awk '/Source:/ { print $2 }' | sed 's/linux-//')
export KSRC="/lib/modules/${KVERS}/build"
export KERNEL_SOURCE_ROOT=${KSRC}
env

# apt -qyy install wget

# VERSION=1.7.l.4.10.0-00014
# wget https://01.org/sites/default/files/downloads/qat$VERSION.tar.gz -O qat$VERSION.tar.gz
mkdir intel-qat
tar xvf ./QAT.L.4.26.0-00008.tar.gz -C intel-qat
chown -R root:root intel-qat
cd intel-qat
./configure --enable-kapi --enable-icp-sriov=host
make install
