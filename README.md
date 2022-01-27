# Digital Ocean Alpine Linux Image Generator

![Build Status](https://github.com/benpye/alpine-droplet/actions/workflows/build.yml/badge.svg?branch=master)

This is a tool to generate an Alpine Linux custom image for Digital Ocean. This ensures that the droplet will correctly configure networking and SSH on first boot using Digital Ocean's metadata service. To use this tool make sure you have `qemu-nbd`, `qemu-img`, `bzip2` and `e2fsprogs` installed. This will not work under the Windows Subsystem for Linux (WSL) as it mounts the image during generation.

Once these prerequisites are installed run:

```bash
# ./build-image.sh
```

Note: Need root permission.

This will produce `alpine-virt-image-{timestamp}.qcow2.bz2` which can then be uploaded to Digital Ocean and used to create your droplet. Check out their instructions at https://blog.digitalocean.com/custom-images/ for uploading the image and creating your droplet.

In this commit, the script will produce alpine `version 3.15` image. If you wanna build latest version, you can pull latest [alpine-make-vm-image repo](https://github.com/alpinelinux/alpine-make-vm-image): `git submodule foreach git pull origin master`
