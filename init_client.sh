#!/bin/bash
#
# Client init script
#
selinuxenabled && setenforce 0

cat >/etc/selinux/config<<__EOF
SELINUX=disabled
SELINUXTYPE=targeted
__EOF

echo "192.168.56.11 server" >> /etc/hosts
mkdir /export
echo "server:/export /export nfs auto,rw,nfsvers=3,proto=udp,sync 0" >>/etc/fstab
mount /export && touch /export/upload/file.txt
