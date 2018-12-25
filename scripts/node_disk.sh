#!/bin/bash
FREE=$(parted /dev/sda unit GB print free | grep 'Free Space' | tail -n1 | awk '{print substr($3, 1, length($3)-5)}')
if [[ $FREE > 0 ]];
then
fdisk /dev/sda <<EEOF
n
p
3


t
3
8e
w
EEOF
partprobe
pvcreate /dev/sda3
vgextend centos /dev/sda3
lvextend /dev/centos/root /dev/sda3
xfs_growfs /dev/mapper/centos-root
else
echo "No free space, not expanding"
fi
lsblk /dev/sdb
if [ $? -eq 0 ]
then
fdisk /dev/sdb <<EEOF
n
p
1


t
8e
w
EEOF
partprobe
pvcreate /dev/sdb1
vgcreate vg-ext1 /dev/sdb1
lvcreate -n docker -l 100%FREE vg-ext1
mkfs.xfs /dev/mapper/vg--ext1-docker
mkdir /var/lib/docker
echo '/dev/mapper/vg--ext1-docker   /var/lib/docker   xfs     defaults        0 0' >> /etc/fstab
mount -a
else
echo "No secondary disk detected."
fi
exit 0