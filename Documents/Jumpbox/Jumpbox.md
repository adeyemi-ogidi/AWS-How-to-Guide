# Nat and Jumpbox

## Assumptions

We assume 1 Public Subnet and 1 Private Subnet exist.

## Create the NAT Security Group

  - Open the Amazon VPC console
    at <https://console.aws.amazon.com/vpc/>.

  - In the navigation pane, choose Security Groups, and then
    choose Create Security Group.

  - In the Create Security Group dialog box, specify NATSG as the name
    of the security group, and provide a description. Select the ID of
    your VPC from the VPC list, and then choose Yes, Create.

![](.//media/image1.png)

  - Select the NATSG security group that you just created. The details
    pane displays the details for the security group, plus tabs for
    working with its inbound and outbound rules.
    
      - Add rules for inbound traffic using the Inbound Rules tab as
        follows:
        
          - Choose Edit.
        
          - Choose Add another rule, and select HTTP from the Type list.
            In the Source field, specify the IP address range of your
            private subnet.
        
          - Choose Add another rule, and select HTTPS from
            the Type list. In the Source field, specify the IP address
            range of your private subnet.
        
          - Choose Add another rule, and select SSH from the Type list.
            In the Source field, specify the public IP address range of
            your network.
        
          - Choose Save.

![](.//media/image2.png)

  - Add rules for outbound traffic using the Outbound Rules tab as
    follows:
    
      - Choose Edit.
    
      - Choose Add another rule, and select HTTP from the Type list. In
        the Destination field, specify 0.0.0.0/0
    
      - Choose Add another rule, and select HTTPS from the Type list. In
        the Destination field, specify 0.0.0.0/0
    
      - Choose Save.

![](.//media/image3.png)

## Launch the Nat Instance

  - Open the Amazon EC2 console.

  - On the dashboard, choose the Launch Instance button

  - Amazon Machine Image (AMI) page: select the Community AMIs category.
    In the search field, enter AMI 2018.03 nat
    
      - Select one of the results that appear

![](.//media/image4.png)

  - On the Choose an Instance Type page, select the instance type,
    + Next

  - On the Configure Instance Details page
    
      - VPC = your VPC
    
      - Subnet = a Public Subnet of yours
    
      - Auto-Assign Public IP Enable

![](.//media/image5.png)

  - Next: Add Storage.

  - Add storage to your instance + Next

  - Configure Security Group page
    
      - select the Select an existing security group option
    
      - select the NATSG security group that you created

  - ![](.//media/image6.png)

  - Choose Review and Launch.

  - Launch and choose a key pair and launch your
instance.

## Disabling source/destination checks to let the NAT send/receive traffic when the source or destination is not itself

  - You can disable the SrcDestCheck attribute for a NAT instance that's
    either running or stopped

  - From EC2 console

  - In the navigation pane, choose Instances.

  - Select the NAT instance, choose Actions, Networking, Change
    Source/Dest. Check.

  - For the NAT instance, verify that this attribute is disabled.
    Otherwise, choose Yes,
Disable.

  - ![](.//media/image7.png)

  - ![](.//media/image8.png)

## Update the Route Table used in your Private Subnet to send all subnet traffic to the NAT Instance

  - In the navigation pane, choose Route Tables.

  - Select the Route Table associated to your Private Subnet

  - On the Routes tab, choose Edit, specify 0.0.0.0/0 in
    the Destination box, select the instance ID of the NAT instance
    from the Target list, and then choose Save.

  - ![](.//media/image9.png)

## Configure NAT connectivity to internet

  - Update your NAT instance's security group rules to allow inbound and
    outbound ICMP traffic and allow outbound SSH traffic,

  - In the navigation pane, choose Security Groups.

  - Find the security group associated with your NAT instance, and
    choose Edit in the Inbound tab.

  - Choose Add Rule, select All ICMP - IPv4 from the Type list, and
    select Custom from the Source list. Enter the IP address range of
    your private subnet, for example, 10.0.2.0/24. Choose Save.

> ![](.//media/image10.png)

  - In the Outbound tab, choose Edit.

  - Choose Add Rule, select SSH from the Type list, and
    select Custom from the Destination list. Enter the IP address
    range of your private subnet, for example, 10.0.2.0/24. Choose Save.

  - Choose Add Rule, select All ICMP - IPv4 from the Type list, and
    select Custom from the Destination list. Enter 0.0.0.0/0, and then
    choose Save.

  - ![](.//media/image11.png)

  - Launch an EC2 instance into your private subnet ensuring to set on
    the Configure Instance Details:
    
      - Network = your VPC
    
      - Subnet = a Private Subnet of yours
    
      - Autoassign Public IP = leave the default or set Disable

  - ![](.//media/image12.png)

  - On the Configure Security Group page, ensure that your security
    group includes an inbound rule that allows SSH access from your NAT
    instance's private IP address, or from the IP address range of your
    public subnet, and ensure that you have an outbound rule that allows
    outbound ICMP traffic.

  - In the Select an existing key pair or create a new key pair dialog
    box, select the same key pair you used to launch the NAT instance.

## Connect to the NAT from Windows

  - Convert your private key to .ppk format [using
    PuTTYgen](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html#putty-private-key).

  - Start Pageant
    
      - choose Add Key
    
      - Select the .ppk file created
    
      - Open

  - Start a PuTTY session to connect to your NAT instance. In
    the Auth category, ensure that you select the Allow agent
    forwarding option, and leave the Private key file for
    authentication field blank.

  - ![](.//media/image13.png)

  - connect to your instance

  - Test that your NAT instance can communicate with the internet by
    running the ping command for a website; for example:

  - 
  - 
  - 
<!-- end list -->

  - \- ![](.//media/image14.png)

  - From your NAT instance, connect to your instance in your private
    subnet by using its private IP address, for example:

> ![](.//media/image15.png)

  - From your private instance, test that you can connect to the
    internet by running the ping command:

  - ![](.//media/image16.png)

  - Press Ctrl+C on your keyboard to cancel the ping command.

## Terminate your EC2 instances

  - From the EC2 Console, select the EC2 Instance in the Private Subnet
    and the NAT instance

  - Action
    
      - Instance Service
        
          - Terminate
