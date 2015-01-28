#!/bin/bash
chown www-data:www-data /kanboard -R
chmod -R 777 /kanboard/data
source /etc/apache2/envvars
exec apache2 -D FOREGROUND
