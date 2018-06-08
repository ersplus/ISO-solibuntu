sudo chroot squashfs
echo "Après chroot"
cd Solibuntu
echo "Avant install"
./install.sh iso
echo "Après install"
apt-get clean
echo "Après clean"
rm -r /var/crash/*
echo "Après supression cash"
umount -lf /sys
umount -lf /proc
umount -lf /dev/pts
umount -lf /dev
echo "Après umount"
rm /etc/resolv.conf
rm /etc/hosts
echo "Après supression fichiers conf"
exit