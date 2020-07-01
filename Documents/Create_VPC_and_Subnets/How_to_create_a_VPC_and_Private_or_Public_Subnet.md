# Create a VPC

  - In “Your VPC” tab

  - Click on "Create VPC”

> ![](.//media/image1.png)

  - Type a value in the following attributes:
    
      - Name Tag: S20\_VPC
    
      - CIDR block: 10.0.0.0/16
    
      - No IPv6 CIDR block

![](.//media/image2.png)

# Create a Private subnet

  - In Tab “Subnets” Click on “Create Subnets”

![](.//media/image3.png)

  - Type the below attributes
    
      - Name tag: My S20 Private
    
      - VPC put the id of your VPC created before
    
      - Availibility regions: select one
    
      - CIDR block: 10.0.1.0/24

# Transform your Private Subnet in a Public Subnet

## Assumption

2 private Subnets are already created.

## Create an Internet Gateway (IGW)

  - Click on “Internet Gateway” and then click on “Create Internet
    gateway”

![](.//media/image4.png)

  - Give it a Name Tag and click Create internet gateway

  - The IGW is created but is detached, i.e. it is not assigned to any
    Subnet

  - Click on Action
    
      - Attach to
VPC

![](.//media/image5.png)

## Configure a route table that redirects traffic toward the IGW and link it to the Subnet that should be public

  - Go to Route Tables and click on “Create route table”

![](.//media/image6.png)

  - Name the Route Table

  - Associate it to your VPC

  - click Create

<!-- end list -->

  - Select the Route Table

  - In the Panel Routes click on Edit Routs

![](.//media/image7.png)

  - Add Route
    
      - Destination 0.0.0.0/0
    
      - Target: the internet Gtw you create
        
          - These 2 settings ensure that all traffic with destination
            0.0.0.0/0 should be directed toward the Internet gateway
        
          - If your route table has multiple routes, AWS will use the
            most specific route that matches the traffic (longest prefix
            match) to determine how to route the traffic.
    
      - Click Save Routes

  - ![](.//media/image8.png)

  - Go to Subnets

  - Select the subnet that should be Public

  - Click on Edit Route Table Association

  - ![](.//media/image9.png)

  - Select the Route Table created before

  - And save it

  - ![](.//media/image10.png)

The set-up of the public Subnet is now completed.

To test the setup is working launch an EC2 Instance in the Public
Subnet, connect to it and try to ping a website.

To see how to launch an EC2 instance and connect to it, please refer to
the other user guides on my github..
