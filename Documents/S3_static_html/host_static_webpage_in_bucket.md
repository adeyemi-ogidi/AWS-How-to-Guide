# Host a static HTML page on S3

## Assumption

We assume an S3 bucket already exists. In the below example the bucket
is named andreawebstaticbucket.

## Enable static website hosting

  - Access the S3 Management Console

  - In the Bucket name list, choose the bucket that you want to use for
    your static website.

  - Choose Properties.

  - Choose Static website hosting.

  - Choose Use this bucket to host a website

![](.//media/image1.png)

  - Enter the name of your index document.

  - The index document name is typically index.html. The index document
    name is case sensitive and must exactly match the file name of the
    HTML index document that you plan to upload to your S3 bucket.

  - Under Static website hosting, note
        the Endpoint.
    
      - <http://andreawebstaticbucket.s3-website-us-east-1.amazonaws.com>
    
      - After you finish configuring your bucket as a static website,
        you can use this endpoint to access your website.

  - Choose Save.

## Edit block public access settings

  - Access the S3 management console

  - Choose the name of the bucket that you have configured as a static
    website.

  - Choose Permissions.

  - Choose Edit.

  - Clear Block all public access, and choose Save.

![](.//media/image2.png)

  - In the confirmation box, enter confirm, and then choose Confirm.

![](.//media/image3.png)

## Add a bucket policy that makes your bucket content publicly available

  - After you edit S3 Block Public Access settings, you can add a bucket
    policy to grant public read access to your bucket.

  - Choose Permissions.

  - Choose Bucket Policy.

  - To grant public read access for your website, copy the following
    bucket policy, and paste it in the Bucket policy editor.

![](.//media/image4.png)

  - Update the Resource to include your bucket name.
    
      - In the preceding example bucket policy, andreawebstaticbucket is
        the bucket name.

  - Choose Save.

## Configure an index document

  - Create the html file that your website should display and make sure
    to save it with the same name you typed when you enabled static
    website hosting for your bucket (for example, index.html), see
    section “Enable static website hosting”.

  - Upload the hmtl document to your bucket, for example via Drag and
    drop

![](.//media/image5.png)

## Test your website endpoint

  - Connect to your website via the
    endpoint

![](.//media/image6.png)

## Clean up

  - ## Once you do not need anymore the bucket for publishing the html page, delete the bucket

  - From the S3 management Console select the bucket

  - Empty the bucket

  - Delete the bucket
