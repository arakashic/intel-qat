#!/bin/sh -ex

export KVERS=$(apt info linux-headers-truenas-production-amd64 | awk '/Source:/ { print $2 }' | sed 's/linux-//')
export KSRC="/lib/modules/${KVERS}/build"
export KERNEL_SOURCE_ROOT=${KSRC}
env

mkdir /intel-qat
tar xvf ./QAT.L.4.26.0-00008.tar.gz -C /intel-qat
chown -R root:root /intel-qat
cd /intel-qat
./configure --enable-kapi --enable-icp-sriov=host --enable-icp-log-syslog
make
cd -
