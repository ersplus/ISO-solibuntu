# Créer une iso Solibuntu (solisol.org):

/!\ Veuillez réaliser ces étapes dans un (x)ubuntu 18.04 (machine virtuelle ou physique) /!\

1/ Récupérez les sources de ce projet :

git clone https://github.com/ersplus/ISO-solibuntu.git

2/ Placez dans le répertoire du projet l'image de Xubuntu 18.04 64 bits

cd ISO-solibuntu/

wget http://ftp.free.fr/mirrors/ftp.xubuntu.com/releases/18.04/release/xubuntu-18.04-desktop-amd64.iso

3/ Installez les programmes suivants :

sudo apt-get update && sudo apt-get install squashfs-tools schroot genisoimage

4/ Exécutez le script makeIsoRemasterSquashfs

sudo ./makeIsoRemasterSquashfs.sh

(Il est possible que vous deviez redémarrer la VM après l'exécution de ce script)

5/ Une fois ceci fait, pour que l'image puisse être copiée sur une clé usb utilisez la commande isohybrid (commande pour l'installer sudo apt install syslinux-utils).

sudo isohybrid solibuntu_master.iso

Pour connaitre la référence de la clé usb :

df -h

Copier l'iso de Solibuntu sur une clé USB :

sudo dd if=solibuntu_master.iso of=/dev/sd?


Scripts 

crt.sh	Contient les commandes qui seront exécutées en chroot dans l’iso lors de sa fabrication.

install_d.sh	Télécharge la version de développement de Solibuntu et lance son installation.

install_m.sh	Télécharge la version stable de Solibuntu et lance son installation.

makeIsoRemasterSquashfs.sh	Script à exécuter pour construire une image Solibuntu.
Donne le choix de fabrication d’une iso stable ou de développement, décompresse l’iso de xubuntu, décompresse l’archive contenant le système de fichiers de xubuntu, exécute des commandes en chroot, place le fichier de preseed et le fichier de configuration du programme d’installation du système d’exploitation dans l’iso.

preInstall.sh	Script exécuté avant le formatage du disque par l’installateur de Solibuntu.
Il affiche une boite de dialogue d’avertissement pour le formatage du disque et une autre d’acceptation des licences.

preseed.cfg	Contient les instructions d’installation du système, telles que les noms et mots de passe par défaut des sessions, ou encore les consignes de formatage du disque.

text.cfg	Fichier de configuration de l’installateur, indique notamment d’utiliser le fichier preseed.cfg.
