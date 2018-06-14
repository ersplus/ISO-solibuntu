echo " ================================= Après chroot ========================================="
useradd -m administrateur -s /bin/bash
echo -e "AdminSolibuntu\nAdminSolibuntu" | passwd administrateur
usermod -c "Administrateur Solibuntu" administrateur
adduser administrateur sudo

useradd -m gestionnaire -s /bin/bash
echo -e "AdminAsso\nAdminAsso" | passwd gestionnaire
usermod -c "Gestionnaire Solibuntu" gestionnaire
echo " ================================= Avant install ========================================"
./install.sh iso
echo " ================================= Après install ========================================"
exit