# Create an EC2 Instance 

## Procedure

  - From the EC2 Console click on “Launch on instance”

![](.//media/image1.png)

  - Select one image (the first one) + Next

![](.//media/image2.png)

  - Select an instance type: take Free-tier + Next

![](.//media/image3.png)

  - Change the network:
    
      - If you want your EC2 to be on the subnet:
        
          - Network: Set your VPC
        
          - Subnet: Set a Public Subnet of yours
        
          - Set Auto-assign Public IP = Enable

![](.//media/image4.png)

  - If you want your EC2 to be on the subnet:
    
      - Network: Set your VPC
    
      - Subnet: Set a private Subnet of yours
    
      - Set Auto-assign Public IP = Enable

![](.//media/image5.png)

  - Select the Storage + Next

![](.//media/image6.png)

  - Add tag and type a Tag - name, eg key = My S20 + Next

  - Create rules for the Security Groups, you can either select an
    already existing Security Group or create a new one depending on the
    option selected in the menu “assign a security group”; to create a
    new security group
    
      - Type a security group name and description
    
      - By default an inbound rule that allows SSH connections coming
        from any IP is defined to allow you to connect in SSH to the
        instance; if you want to add other rules for example to ping
        your instance from outside the VPC (assuming your instance is
        running on Public Subnet):
        
          - Add Rule
        
          - Type: All ICMP IPV4
        
          - source 0.0.0.0/24 (needed if your instance runs on a Public
            Subnet and you want to be able to ping it from outside the
            vpc)

![](.//media/image7.png)

  - Review and Launch

  - Decide whether use an already existing key or create a new one.
    
    You must have the Key file to log into the instance; if you loose
    it, you will not be able to access the EC2 instance anymore

![](.//media/image8.png)

  - Once launched, the EC2 instance will be displayed in the control
    panel along with information about its status and its Public IP

![](.//media/image9.png)

## Ping your EC2 instance

  - We assume the EC2 instance is running on a Public Subnet and its
    Security group allows incoming ICMP traffic

  - From the EC2 Control Panel Retrieve the Public IP of your EC2
    instance, e.g. 54.89.204.77

  - Open a terminal in your pc and type
    
    ping 54.89.204.77

# Connect to an EC2 Instance from Windows

## Assumption

  - We assume that an EC2 Instance was created in a public Subnet

## Procedure

  - Download and install Putty

  - Convert your private key using PuTTYgen

  - Run PuTTYgen

  - Under Type of key to generate, choose RSA

  - Choose Load. By default, PuTTYgen displays only files with the
    extension .ppk. To locate your .pem file, choose the option to
    display files of all types.

  - Select your .pem file for the key pair that you specified when you
    launched your instance and choose Open. PuTTYgen displays a notice
    that the .pem file was successfully imported. Choose OK.

  - To save the key in the format that PuTTY can use, choose Save
    private key. PuTTYgen displays a warning about saving the key
    without a passphrase. Choose Yes.

  - Specify the same name for the key that you used for the key pair
    (for example, my-key-pair) and choose Save. PuTTY automatically adds
    the .ppk file extension.

  - Start PuTTY (from the Start menu, choose All Programs, PuTTY,
    PuTTY).

  - In the Category pane, choose Session and complete the following
    fields:

  - In the Host Name box, type UserName@\<public\_IPv4\_of\_EC2\>, e.g.:
    ec2-user@54.89.204.77
    
      - **Note:** The public IP is displayed in the EC2 console, column
        IPv4 Public IP
    
      - **Note**: the user name can either be your user account you used
        to launch the instance or the default one according to the
        below:
    
      - For Amazon Linux 2 or the Amazon Linux AMI, the user name is
        ec2-user.
    
      - For a CentOS AMI, the user name is centos.
    
      - For a Debian AMI, the user name is admin or root.
    
      - For a Fedora AMI, the user name is ec2-user or fedora.
    
      - For a RHEL AMI, the user name is ec2-user or root.
    
      - For a SUSE AMI, the user name is ec2-user or root.
    
      - For an Ubuntu AMI, the user name is ubuntu.

![](.//media/image10.png)

  - Ensure that the Port value is 22

  - Under Connection type, select SSH.

  - In the Category pane, expand Connection, expand SSH, and then choose
    Auth. Complete the following:
    
      - Choose Browse.
    
      - Select the .ppk file that you generated for your key pair and
        choose Open.
    
      - Choose Open.

![](.//media/image11.png)

  - If this is the first time you have connected to this instance, PuTTY
    displays a security alert dialog box that asks whether you trust the
    host to which you are connecting.

  - Choose Yes. A window opens and you are connected to your instance.

![](.//media/image12.png)

  - To exit your instance type “exit”

  - **Note:** Terminate your instances if not needed - see How to
    terminate your EC2 instances

## 

## Terminate your EC2 instances

  - From the EC2 Console, select the EC2 you want to terminate

  - Action
    
      - Instance Service
        
          - Terminate

![](.//media/image13.png)

## 


