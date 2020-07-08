# Run a php page on an Apache Server on Ubuntu EC2 that shows the local IP of the server

## Install Apache on an Ubuntu EC2

  - Launch an Ubuntu EC2 instance making sure to:
    
      - Run it on a Public Subnet
    
      - the Auto-Assign IP feature is set to Enable
    
      - the Security group allows HTTP (optionaly HTTPS) inbound traffic

![](.//media/image1.png)

  - Connect to the EC2 instance via Putty; **remember to use a proper
    username for ubuntu instances (e.g. ubuntu)**

  - From the terminal run
    
      - sudo apt update (this will update update local package index)
    
      - sudo apt install apache2 (this will install apache2)
    
      - sudo systemctl status apache2 (this will check whether your
        apache server is running)

  - Check whether the Apache server is working fine going from your
    browser to:
    
      - <http://EC2-public-ip>
    
      - The following page should be displayed

![](.//media/image2.png)

## Install PHP

  - Run from terminal:
    
      - sudo apt install php libapache2-mod-php
    
      - php -v (to check php being installed)

  - Test a php page
    
      - sudo nano /var/www/html/phpinfo.php
    
      - copy the following:
        
          - \<?php phpinfo( ); ?\>
    
      - Save the file with ctrl+o (confirm the name)
    
      - and exit with ctrl + x

  - A similar page should be displayed at the following link:
    http://EC2-public-ip/phpinfo.php

![](.//media/image3.png)

  - Create another file in the www folder named index.php
    
      - sudo nano /var/www/html/index.php
    
      - Note that you are using the sudo so if you want to edit the file
        you have to use sudo again

  - Inside the file copy the the following piece of code:
    
      - \<?php
        
        echo $\_SERVER\['SERVER\_ADDR'\];
        
        ?\>

  - Save the file

  - From your browser go to <http://EC2-public-ip/index.php>

![](.//media/image4.png)

## Cleanup

Once you are done with this task, terminate the EC2 instance from the
EC2 AWS console. Please be aware tha terminating the EC2 instance you will lose anything saved on it.
[To see how to terminate an instance, please click here](https://github.com/asonnellini/AWS-How-to-Guide/blob/master/Documents/Create_EC2/Create_an_EC2_Instance.md#terminate-your-ec2-instances)
