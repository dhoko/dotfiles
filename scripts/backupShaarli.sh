#!/bin/bash

DATECURRENT="$(date '+%Y-%m-%d')"
BACKUPDIR="/home/dhoko/backup/shaarli/$DATECURRENT/"

echo  -e "\e[00;35mBackup Shaarli du $(date '+%Y-%m-%d %H:%M') \e[00m"
echo

if [ ! -d "$BACKUPDIR" ]; then
    echo "Creation du dossier de backup..."

    if ! mkdir $BACKUPDIR; then
        echo -e "\e[00;41mERROR\e[00m Fuuuuu";
        exit $?
    fi
    echo -e "\e[00;42mSUCCESS\e[00m Dossier créé : $BACKUPDIR"
    echo
fi

echo "Téléchargement de la config Shaarli..."
echo

if ! scp -r hypnos@elysion:/var/www/dhoko.me/liens/data/ $BACKUPDIR ; then
    echo -e "\e[00;41mERROR\e[00m Fuuuuu";
    exit $?
fi

echo -e "\e[00;42mSUCCESS\e[00m Backup terminé, dispo ici $BACKUPDIR";
exit 0
