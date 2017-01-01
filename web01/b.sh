#!/bin/sh
TIMESTAMP=`date +%s%N`
rm -rf temp
mkdir temp
cp /var/www/html/* temp
tar zcvf web01_$TIMESTAMP.tgz temp
ccrypt web01_$TIMESTAMP.tgz
rm -rf temp
#use ccdecrypt to decrypt
