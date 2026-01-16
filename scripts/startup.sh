#!/bin/bash

cd /var/www/html

php maintenance/run.php installPreConfigured

exec apache2-foreground
