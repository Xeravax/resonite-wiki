#!/bin/bash

cd /var/www/html

. patches.sh

composer update --no-interaction

php maintenance/run.php update --quick

exec apache2-foreground
