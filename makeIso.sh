#!/bin/bash

# Récupère l'iso, le fichier de preseed et le isolinux.cfg modifié
iso=$1
preseed=$2
txt=$3
#pt=$4

# Définit dans quel dossier est exécuté le script
local=`pwd`

# Décompresse l'iso dans le dossier "FichierIso"
7z x -o$local/FichierIso $iso

# Remplace le fichier "xubuntu.seed" par notre fichier de preseed
cp $preseed $local/FichierIso/preseed/xubuntu.seed

# Remplace le fichier isolinux.cfg par notre fichier
cp $txt $local/FichierIso/isolinux/isolinux.cfg

# Test
#mkdir $local/FichierIso/Bitonio
#echo "Vous allez finir dans le grand Pot-Au-Feu !" > $local/FichierIso/Bitonio/Pot-Au-Feu.txt
#mkdir $local/FichierIso/Solibuntu
#cp $pt $local/FichierIso/Solibuntu/pt.sh
# Crée une image nommée "preseed_test.iso" à partir du dossier "FichierIso"
cd $local/FichierIso
genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed_test.iso .
#mkisofs -J -r -v -o $local/preseed_test.iso -V Solibuntu -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table $local/FichierIso
mv preseed_test $local
# Supprime le dossier "FichierIso devenu inutile"
cd $local/
rm -rf FichierIso/

#Signale la fin de l'installation
echo "Done."