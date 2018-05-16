#!/bin/bash

iso=$1
preseed=$2
txt=$3

local=`pwd`

7z x -o$local/FichierIso $iso

cp $preseed $local/FichierIso/preseed/xubuntu.seed
cp $txt $local/FichierIso/isolinux/isolinux.cfg
cd $local/FichierIso
genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed_test.iso .
mv $local/FichierIso/preseed_test.iso $local/
cd $local/
rm -rf FichierIso/

echo "Done."