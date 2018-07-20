#! /bin/bash

### Projet Solisol.org               ###
### Solibuntu dev                    ###
### Installation Solibuntu dev       ###
### 28/04/2018                       ###


repinstallation="/opt/borne"

#-------------------------------------------------------
#  Réccupération des sources Dev du projet
#-------------------------------------------------------

cd /opt/
# Check branche dev
wget https://github.com/ersplus/solibuntu/archive/master.zip -O /opt/master.zip

if [ $? == 0 ] ; then
	rm -rf /opt/borne
	unzip master.zip
	mv /opt/solibuntu-master $repinstallation
	chmod +x $repinstallation/scripts/*.sh
	rm master.zip

	cd /opt/borne/scripts
	./install.sh $1

	echo "Fin de l'installation"
fi
exit 0