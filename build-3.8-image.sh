#!/bin/sh
./alpine-make-vm-image/alpine-make-vm-image -p openssh -c -f qcow2 alpine-3.8-virt.qcow2 ./setup.sh
bzip2 -z alpine-3.8-virt.qcow2
