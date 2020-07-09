#!/bin/bash
apt-get -y update
apt-get -y install apache2
apt-get -y install php libapache2-mod-php
echo "<?php echo \$_SERVER['SERVER_ADDR']; ?>" > /var/www/html/index.php
