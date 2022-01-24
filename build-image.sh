#!/bin/sh
F=alpine-virt-image-$(date +%Y-%m-%d-%H%M)

if [ "$CI" = "true" ]
then
    echo "Running under CI"
    echo $F > version
fi

./alpine-make-vm-image/alpine-make-vm-image --packages "openssh e2fsprogs-extra" --script-chroot --image-format qcow2 $F.qcow2 -- ./setup.sh
bzip2 -z $F.qcow2
