#!/bin/bash
#
# Server init script
#
selinuxenabled && setenforce 0

cat >/etc/selinux/config<<__EOF
SELINUX=disabled
SELINUXTYPE=targeted
__EOF

sed -i.bak -e '/# tcp=y/a udp=y' /etc/nfs.conf

mkdir -p /export/upload
chmod o+w /export/upload

echo "/export *(rw,sync,no_root_squash,no_all_squash)" > /etc/exports
exportfs -r

systemctl enable firewalld rpcbind nfs-server
systemctl start firewalld
firewall-cmd --permanent --add-service={mountd,rpc-bind,nfs3}
firewall-cmd --reload

systemctl start rpcbind nfs-server
