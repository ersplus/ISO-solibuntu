echo " ================================= Après chroot ========================================="
chroot squashfs
useradd -m administrateur -s /bin/bash
echo -e "AdminSolibuntu\nAdminSolibuntu" | passwd administrateur
usermod -c "Administrateur Solibuntu" administrateur
adduser administrateur sudo
useradd -m gestionnaire -s /bin/bash
echo -e "AdminAsso\nAdminAsso" | passwd gestionnaire
usermod -c "Gestionnaire Solibuntu" gestionnaire
echo " ================================= Avant install ========================================"
./Solibuntu/install.sh iso
echo " ================================= Après install ========================================"
umount -lf /sys
umount -lf /proc
umount -lf /dev/pts
umount -lf /dev #dans le cas où on a exécuté sudo mount --bind /dev squashfs/dev pour le problème avec apt
rm /etc/resolv.conf
rm /etc/hosts
exit