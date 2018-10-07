# Digital Ocean Alpine Linux Image Generator [![Build Status](https://travis-ci.com/benpye/alpine-droplet.svg?branch=master)](https://travis-ci.com/benpye/alpine-droplet)

This is a tool to generate an Alpine Linux custom image for Digital Ocean. This ensures that the droplet will correctly configure networking and SSH on first boot using Digital Ocean's metadata service. To use this tool make sure you have `qemu-nbd`, `qemu-img`, `bzip2` and `e2fsprogs` installed. This will not work under the Windows Subsystem for Linux (WSL) as it mounts the image during generation.

Once these prerequisites are installed run:

`# ./build-3.8-image.sh`

This will produce `alpine-virt-$TIMESTAMP.qcow2.bz2` which can then be uploaded to Digital Ocean and used to create your droplet. Check out their instructions at https://blog.digitalocean.com/custom-images/ for uploading the image and creating your droplet.
