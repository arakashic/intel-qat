#!/bin/sh -ex
VERSION=1.7.l.4.11.0-00001
wget https://01.org/sites/default/files/downloads/qat$VERSION.tar.gz -O qat-$VERSION.tar.gz
tar xvf qat-$VERSION.tar.gz -C qat-$VERSION
chown -R root:root  QAT
cd qat-$VERSION
./configure --enable-kapi
make
#cp pcm*.x ..
