zenity --list --radiolist --width=500 \
--text "Installer Solibuntu entrainera la perte de toutes vos données non-sauvegardées, voulez-vous continuer ?" \
--column "Sélectionner" --column "Options" TRUE "Oui" FALSE "Non"
if [ $? == "Non" ] ; then 
	shutdown 0 
fi