# Create EC2 with User Data script such that it downloads from non-public S3 bucket an index.php page and publish it on the web

## Preliminary checks and attempts

  - Upload an index.php file on a non-public S3 bucket – in this example
    the bucket name is php-bucket-for

![](.//media/image1.png)

  - In this example the file index.php contains the following php code:
    ```
    \<?php echo $\_SERVER\['SERVER\_ADDR'\]; ?\>
    ```
  - Create an EC2 instance that has the **awscli** package installed
    (for example the AMAZON Linux AMI) and check if you are able to
    download a file from a non-public S3 bucket running the following
    command
    ```
    aws s3 cp s3://\<Bucket name\>/\<file name\> \<path/file name where to save the file on the EC2 instance\>
    ```
  - In my case I received the below error
    
    ![](.//media/image2.png)

## Create an AMI role to access S3 buckets from an EC2 instance

  - Open the IAM console.

![](.//media/image3.png)

  - Choose Roles, and then choose Create role.

![](.//media/image4.png)

  - Select AWS Service, and then choose EC2

![](.//media/image5.png)

  - Select Next: Permissions

  - Search for the AmazonS3FullAccess managed policy and then select it

![](.//media/image6.png)

  - Select Next: Tags, insert a Name Tag and then select Next: Review.

  - Enter a Role name, and then select Create role.

## Associate the instance to the IAM Policy

  - If the EC2 instance is already created, from the EC2 Console select
    it
    
      - Actions
    
      - Instance Settings
    
      - Attach/replace IAM role

![](.//media/image7.png)

  - In the subsequent page select the IAM role you created to access S3
    buckets, and then click Apply

![](.//media/image8.png)

  - If the EC2 instance is not created, create it, and at step “3 -
    Configure instance” select the proper IAM

![](.//media/image9.png)

  - Once the instance is up and running connect to it, re-rerun the
    command and check that the file in the S3 bucket gets downloaded:
    ```
    aws s3 cp s3://\<Bucket name\>/\<file name\> \<path/file name where
    save the file on the EC2 instance\>
    ```
    
![](.//media/image10.png)

  - Note: depending on the permissions of your ec2 user, you may need to
    run the same command adding **sudo** at the beginning

## Create the script to create an EC2 instance that download a php file from S3 and publish it on the web 

Copy the below content in a script to be used as User Data to be run
when the EC2 is created – attached on github you can find the script I
used to test (install\_apache\_php\_linux\_and\_download\_from\_S3.sh)
```
\#\!/bin/bash
yum update -y
yum install -y httpd24 php56 php56-mysqlnd
service httpd start
aws s3 cp s3://php-bucket-for/index.php /var/www/html/index.php
```
## Test the script

  - Create an Amazon LINUX AMI EC2 that can connect to Internet and
    ensure at step 3 to:
    
      - Select the IMA previously created

![](.//media/image11.png)

  - Upload the script

![](.//media/image12.png)

  - Complete the setup and launch the EC2

  - When the instance is up and running, from your browser go to
    <http://EC2-public-ip/index.php> and check if the IP is displayed
    
    ![](.//media/image13.png)

## Cleanup

Once you are done with this task:

  - Terminate the EC2 instance; Please be aware that terminating an EC2
    instance any data on its volumes will be lost

  - Empty and then Delete the S3 bucket

  - You may want to delete the IMA policy as well from the IMA Console
