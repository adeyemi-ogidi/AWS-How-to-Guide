# How to run a Load Balancer that manages a website page hosted on 2 different EC2 instances

## Prerequisite

  - A virtual private cloud (VPC) with one public subnet in two
    or more Availability Zones exists

  - Have 2 EC2 instances up and running on 2 public subnets (in 2 differents AZ), each of them hosting a php page on apache server

  - The php page name is index.php and shows the private IP of the EC2 that hosts it

## Configure the Load Balancer

  - From EC2 Console choose on the left menu Load Balancers

  - Create Load Balancer

![](.//media/image1.png)

  - Choose Application Load Balancer

  - Type a Name and for Scheme tick the option “internet-facing”

  - In Availability Zone, select your VPC and 2 public subnets from 2
    different zones

![](.//media/image2.png)

  - Click Next: Configure Security Groups

  - Select Create a new security group and let the Type = Custom TCP
    Rule

  - Click Next

> ![](.//media/image3.png)

  - Name the target

> ![](.//media/image4.png)

  - On Register Targets, select your 2 EC2 and click on Add to
    registered

![](.//media/image5.png)

  - Click Next

  - Click Create

  - From the Load Balancer Console, you should be able to see the load
    balancer instance be created – wait until the Column State shows
    Active
    
    ![](.//media/image6.png)

  - Check also the listeners are registered clicking on tab Listeners
    and then on the name of the target group
    
    ![](.//media/image7.png)

  - Check the status of is healthy

![](.//media/image8.png)

## Test the setup

  - From a browser connect to the address:
    
      - \<load balancer DNS name\>/\<webpage hosted on the EC2
        instances\>
    
      - E.g.:
        
          - ELB1234.amazonaws.com/index.php

  - Refresh the page frequently, and you should see in some cases the
    page from one EC2 instance and in some other the page from the other
    EC2 instance; each of them will show indeed its own private IP
    (which is different)
    
    ![](.//media/image9.png)
    
    ![](.//media/image10.png)

## Cleanup

Once the task is completed:

  - Terminate the EC2 instances

  - Delete the Load Balancer

  - Delete the Target group
