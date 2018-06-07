cd $1
chroot squashfs
./Solibuntu/install.sh iso
apt-get clean
rm -r /var/crash/*
umount -lf /sys
umount -lf /proc
umount -lf /dev/pts
umount -lf /dev
rm /etc/resolv.conf
rm /etc/hosts
exit