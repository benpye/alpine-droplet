#!/bin/sh

rc-update add sshd default
rc-update add networking default

echo -e "auto lo\niface lo inet loopback\nauto eth0\niface eth0 inet dhcp" > /etc/network/interfaces

mkdir -p /root/.ssh
chmod 700 /root/.ssh

echo -e "#!/bin/sh\nwget -T 5 http://169.254.169.254/metadata/v1/hostname -q -O /etc/hostname\nhostname -F /etc/hostname\nwget -T 5 http://169.254.169.254/metadata/v1/public-keys -O /root/.ssh/authorized_keys\nchmod 600 /root/.ssh/authorized_keys\nrc-update del do-init default\nexit 0" > /bin/do-init
echo -e "#!/sbin/openrc-run\ndepend() {\n       need networking\n}\ncommand=\"/bin/do-init\"\ncommand_args=\"\"\npidfile=\"/tmp/do-init.pid\"\n" > /etc/init.d/do-init

chmod +x /etc/init.d/do-init
chmod +x /bin/do-init

rc-update add do-init default
