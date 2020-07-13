#!/bin/bash
yum update -y
yum install -y httpd24 php56 php56-mysqlnd
service httpd start
aws s3 cp s3://php-bucket-for/index.php /var/www/html/index.php