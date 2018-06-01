zenity --question --text="Installer Solibuntu entraînera la perte de toutes vos \
données n'ayant pas été sauvegardées, désirez-vous toujours l'Installer ?" \
--ok-label "Oui, continuer" --cancel-label="Non, arrêter l'installation"

if [ $? == 1 ] ; then 
	poweroff
fi