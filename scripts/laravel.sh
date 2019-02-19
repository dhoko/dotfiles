#!/bin/bash
rsync -avz --exclude ".git/" --delete /home/dhoko/dev/laravel/ www-data@192.168.0.22:/var/www/laravel/

notify-send  'Synchronisation au serveur de Laravel sur le Pi'
