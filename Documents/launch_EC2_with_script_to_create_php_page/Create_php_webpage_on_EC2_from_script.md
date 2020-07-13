# How to create an EC2 instance that publishes a php page using a User Data script

## Create the script

Depending on whether you will use UBUNTU AMI or LINUX AMI you should use
one of the 2 below scripts – attached on this github page you can find
2 scripts "ready" for use.

### Ubuntu (install_apache_php_ubuntu.sh)

\#\!/bin/bash

apt-get -y update

apt-get -y install apache2

apt-get -y install php libapache2-mod-php

echo "\<?php echo \\$\_SERVER\['SERVER\_ADDR'\]; ?\>" \>
/var/www/html/index.php

### Linux (install_apache_php_linux.sh)

\#\!/bin/bash

yum update -y

yum install -y httpd24 php56 php56-mysqlnd

service httpd start

echo "\<?php echo \\$\_SERVER\['SERVER\_ADDR'\]; ?\>" \>
/var/www/html/index.php

## Create the EC2 adding the script to User Data
  - From the EC2 Console Management, click on Launch Instance
  - AMI: Select either:
    
      - An Amazon Linux AMI (do **NOT** select Amazon Linux 2)

![](.//media/image1.png)

  - OR

  - An Ubuntu AMI

![](.//media/image2.png)

  - Continue with the installation as usual ensuring the EC2 is created
    in your VPC public subnet

![](.//media/image3.png)

  - At Step 3 add the script install\_apache\_php.sh in the User Data
    tab

![](.//media/image4.png)

  - Complete the setup of the EC2 instance and launch it

## Test the setup

  - Once the EC2 is up and running, open the webpage
    PublicIP\>/index.php

  - The private IP of the EC2 instance should be displayed

![](.//media/image5.png)

![](.//media/image6.png)

## Cleanup

Terminate the EC2 instance. Please be aware you will lose the data on
the volume.
