#!/bin/sh
FILENAME=alpine-do-virt-$(date +%Y-%m-%d-%k%M)

if [ "$CI" = "true" ]
then
    echo "Running under CI"
    echo $FILENAME > version
fi

./alpine-make-vm-image/alpine-make-vm-image --packages "openssh e2fsprogs-extra" --script-chroot --image-format qcow2 $FILENAME.qcow2 -- ./setup.sh
bzip2 -z $FILENAME.qcow2
