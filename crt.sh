sudo chroot squashfs
echo " ================================= Après chroot ========================================="
cd Solibuntu
useradd -m administrateur
echo -e "AdminSolibuntu\nAdminSolibuntu" | passwd administrateur
usermod -c "Administrateur Solibuntu" administrateur

useradd -m gestionnaire
echo -e "AdminAsso\nAdminAsso" | passwd gestionnaire
usermod -c "Gestionnaire Solibuntu" gestionnaire
echo " ================================= Avant install ========================================"
./install.sh iso
echo " ================================= Après install ========================================"
apt-get clean
echo " ================================== Après clean ========================================="
rm -r /var/crash/*
echo " ============================= Après supression cache ==================================="
umount -lf /sys
umount -lf /proc
umount -lf /dev/pts
umount -lf /dev
echo " ================================== Après umount ======================================="
rm /etc/resolv.conf
rm /etc/hosts
echo " ========================== Après supression fichiers conf =============================="
exit