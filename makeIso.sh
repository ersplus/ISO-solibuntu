#!/bin/bash

# Récupère l'iso, le fichier de preseed et le isolinux.cfg modifié
iso=$1
preseed=$2
txt=$3

# Définit dans quel dossier est exécuté le script
local=`pwd`

# Décompresse l'iso dans le dossier "FichierIso"
7z x -o$local/FichierIso $iso

# Remplace le fichier "xubuntu.seed" par notre fichier de preseed
cp $preseed $local/FichierIso/preseed/xubuntu.seed

# Remplace le fichier isolinux.cfg par notre fichier
cp $txt $local/FichierIso/isolinux/isolinux.cfg

# Crée une image nommée "preseed_test.iso" à partir du dossier "FichierIso"
cd $local/FichierIso
genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed_test.iso .

# Sort l'image du dossier "FichierIso"
mv $local/FichierIso/preseed_test.iso $local/

# Supprime le dossier "FichierIso devenu inutil"
cd $local/
rm -rf FichierIso/

#Signale la fin de l'installation
echo "Done."