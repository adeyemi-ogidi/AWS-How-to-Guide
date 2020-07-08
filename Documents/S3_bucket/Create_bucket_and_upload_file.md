## Create a Bucket 

  - Search S3 in the Services panel

![](.//media/image1.png)

  - Create bucket

> ![](.//media/image2.png)

  - Give it a name and select a region

![](.//media/image3.png)

  - If you want to let the bucket be public on internet untick the
    option “Block all public access” and tick the disclaimer that
    appears

![](.//media/image4.png)

  - Click on Create and your bucket will be created

## Upload a file in the bucket 

  - Click on the Bucket

  - Click on upload

  - Select the file to be uploaded

  - Next

![](.//media/image5.png)

  - Set permissions for the file from the Menu “Manage public
    permissions:
    
      - to become public select the option shown below

![](.//media/image6.png)

  - select the class storage you prefer (check pricing), in our case
    standard + next

![](.//media/image7.png)

  - Click on upload and the file will then be uploaded

  - If you then select the file you will see some details about it on
    the right, including the url via which the file can be downloaded
    (public link given the options we selected before)

![](.//media/image8.png)

## Change the permissions on the bucket

  - From the S3 console, select the bucket of your interest

  - Click on Permissions

  - Click on Edit

  - Tick the option “Block all public access” + save

> ![](.//media/image9.png)

  - Note if the whole bucket is set not to be public, none of the files
    in the bucket can be set as public

## Change the permissions on a single file

  - Click on the File

  - Permissions

  - In the Tab Public Access click on Everyone

  - In the tab that popup tick the option “Read object” + save

![](.//media/image10.png)

## Cleanup

  - From S3 management Console, select the Bucket

  - Delete
