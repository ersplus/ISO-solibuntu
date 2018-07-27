# InstallationAutoSolibuntu
Créer une iso solibuntu :

/!\ Veuillez réaliser ces étapes dans une machine virtuelle xubuntu 18.04 /!\

1/ Récupérez ce projet :

git clone https://github.com/bastlenoob/InstallationAutoXubuntu.git

2/ Placez dans le répertoir du projet l'image de xubuntu 18.04 64 bits

cd InstallationAutoXubuntu/

wget http://ftp.free.fr/mirrors/ftp.xubuntu.com/releases/18.04/release/xubuntu-18.04-desktop-amd64.iso

3/ Installez les programmes suivants :

sudo apt-get update && sudo apt-get install squashfs-tools schroot genisoimage

4/ Exécutez le script makeIsoRemasterSquashfs

sudo ./makeIsoRemasterSquashfs.sh

(Il est possible que vous deviez redémarrer la VM après l'exécution de ce script)

5/ Une fois ceci fait, pour que l'image puisse être copiée sur une clé usb utilisez la commande isohybrid (commande possiblement indisponible dans la machine virtuelle) ou un utilitaire de creation de support USB dédié.

sudo isohybrid preseed_test.iso
