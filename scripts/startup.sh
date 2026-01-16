#!/bin/bash

cd /var/www/html

php maintenance/run.php update

exec apache2-foreground