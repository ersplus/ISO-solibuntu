#!/bin/bash

# Récupère l'iso, le fichier de preseed et le isolinux.cfg modifié
iso=$1
preseed=$2
txt=$3
postInstall=$4
preInstall=$5

echo "Les paquets suivants doivent être installés : \n"
echo "squashfs-tools schroot genisoimage"

# Définit dans quel dossier est exécuté le script
local=`pwd`

# Décompresse l'iso dans le dossier "FichierIso"
7z x -o$local/FichierIso $iso

# Crée le dossier squashfs
mkdir $local/squashfs

# Monte le filesystem
mount -t squashfs -o loop $local/FichierIso/casper/filesystem.squashfs /mnt

# Récupère les fichiers
cp -av /mnt/. $local/squashfs

# Démonte le squashfs
umount /mnt

#-----------------------------------------------------------
# Modification du système de fichier préinstallé ici
#-----------------------------------------------------------

# Rajoute le dossier Solibuntu
mkdir $local/squashfs/Solibuntu/

# Déplace le script de post install dans le dossier Solibuntu
cp $pi $local/squashfs/Solibuntu/install.sh

#-----------------------------------------------------------
# Fin des modifications du système de fichier préinstallé
#-----------------------------------------------------------

# Efface l'ancien filesystem
rm $local/FichierIso/casper/filesystem.squashfs

# Recrée un nouveau filesystem
cd squashfs
mksquashfs . ../FichierIso/casper/filesystem.squashfs -info
cd $local

# Remplace le fichier "xubuntu.seed" par notre fichier de preseed
cp $preseed $local/FichierIso/preseed/xubuntu.seed

# Remplace le fichier isolinux.cfg par notre fichier
cp $txt $local/FichierIso/isolinux/isolinux.cfg

# Déplace le script de pre install
cp $preInstall $local/FichierIso/preInstall.sh

# Régénère une nouvelle somme de contrôle MD5
cd $local/FichierIso
sudo bash -c "find . -path ./isolinux -prune -o -type f -not -name md5sum.txt -print0 | xargs -0 md5sum | tee $"

# Crée une image nommée "preseed_test.iso" à partir du dossier "FichierIso"
cd $local/FichierIso
genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed_test.iso .
#mkisofs -J -r -v -o $local/preseed_test.iso -V Solibuntu -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table $local/FichierIso

# Déplace le fichier iso dans le dossier local
mv preseed_test.iso $local

# Supprime le dossier "FichierIso devenu inutile"
cd $local/
rm -rf FichierIso/ 
rm -rf squashfs/

#Signale la fin de l'installation
echo "Done."
