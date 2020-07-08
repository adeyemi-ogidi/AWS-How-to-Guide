# Create and connect to a MySql DB on AWS

## Create the DB

  - Go to RDS Management Console and click on Create Database

![](.//media/image1.png)

  - Select MySql among the available Engine Options

  - Select Free Tier among the Templates

  - Type a name for the db

  - Type a master username + pwd

![](.//media/image2.png)

  - In Connectivity panel
    
      - Select your VPC
    
      - Select Publicly accessible - Yes

![](.//media/image3.png)

  - Click Create database

  - To check that the database is ready, from the RDS management
    console, click on the database and check that the field Info shows
    available

![](.//media/image4.png)

![](.//media/image5.png)

  - Create a subnet Group for the DB
    
      - From the VPC Console create a Public Subnet ensuring that
        eventually your set of subnets will cover at least 2 AZ
    
      - In the DB Console click on Subnet groups
    
      - Create DB Subnet Group selecting your VPC and 2 subnets
        belonging to 2 different AZ

  - Ensure you have a Security Group that allows incoming traffic

  - Start again the procedure to create the DB and ensure to select:
    
      - The Subnet Group you previously defined
    
      - Publicly accessible Yes
    
      - A Security group that allows incoming traffic

> ![](.//media/image6.png)

  - Click Create database error

![](.//media/image7.png)

  - Indeed from the VPC Panel DNS Hostnames is disabled

![](.//media/image8.png)

  - To enable it, select the VPC in object Action Edit DNS Hostnames and
    enable it

![](.//media/image9.png)

## Connect to the Database from Workbench

  - Open the RDS console and then choose Databases to display a list of
    your DB instances.

  - Choose the MySQL DB instance name to display its details.

  - On the Connectivity & security tab, **copy the endpoint** and **port
    number**. Both are needed to connect to the DB instance.

![](.//media/image10.png)

## Connect to the Database with Workbench

  - Open Workbench

  - Click on “+” to create a new connection

  - In the New Connection Panel set:
    
      - Hostname = End point
    
      - Port: the Port shown in the AWS DB Connectivity and Security tab
    
      - User: the user you entered when creating the DB

![](.//media/image11.png)

## Create a table

  - From MyWorkbench click on Add schema and type a name for the schema
    + Apply

  - Select the Schema and then Click on Create Table
    
      - Enter a name for the table
    
      - Enter columns name and their type
    
      - Apply

  - Insert one record

![](.//media/image12.png)

  - To close the connection: File Exit

## Cleanup

  - On AWS DB maintenance Console select the DB

  - Actions

  - Delete

  - CHECK IF YOU WANT TO TAKE A FINAL SNAPSHOT
