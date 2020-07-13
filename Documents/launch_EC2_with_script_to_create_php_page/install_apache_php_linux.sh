#!/bin/bash
yum update -y
yum install -y httpd24 php56 php56-mysqlnd
service httpd start
echo "<?php echo \$_SERVER['SERVER_ADDR']; ?>" > /var/www/html/index.php