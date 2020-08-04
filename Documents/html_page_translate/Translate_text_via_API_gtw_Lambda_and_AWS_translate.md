# How to create a static html webpage that translates input text using a Lambda function via API gtw

This exercise is a simple follow up from the AWS tutorial [“Build a
serverless Web
application”](https://aws.amazon.com/getting-started/hands-on/build-web-app-s3-lambda-api-gateway-dynamodb/).

## Create a Lambda Function that passes incoming text to Amazon translate Service 

  - From the AWS Management Console go to Lambda

  - Click on “Create function”
    
      - Author from scratch
    
      - Give a name to the function
    
      - Select Python 3.8 from the Runtime menu
    
      - Click on Create function

![](.//media/image1.png)

  - In the section Function code we code the Lambda function

![](.//media/image2.png)

  - In our case we need a function that:
    
      - Takes the input values contained in the Json fields:
        
          - sourceText – text to be translated
        
          - lang – target language for the translation
    
      - Passes the text to Amazon translate Service
    
      - Returns to the user the translated text

  - The following should work:

\`\`\`

import json

import boto3

def lambda\_handler(event, context):

\# event is a dict-like variables where each key is the name of the
fields in the incoming json

source = event\['sourceText'\]

lang = event\['lang'\]

translate = boto3.client(service\_name='translate')

try:

response = translate.translate\_text(Text=source,
SourceLanguageCode='fr', TargetLanguageCode= lang )

result = response.get('TranslatedText')

except Exception as e:

result = "Translation failed - " + str(e)

return {

'statusCode': 200,

'body': json.dumps(result)

}

\`\`\`

  - Click on Save

## Test the Lambda function

  - Once you typed the code, click on the drop down menu next to Test,
    and click on “Configure test events”

![](.//media/image3.png)

  - Fill the test case with the following JSON which simulates the
    incoming JSON that the Lambda function has to process

{

"sourceText": "Bonjour",

"lang": "it"

}

  - Click Create

  - Then click Test to check whether the Test JSON of the use case above
    is processed correctly

  - We receive the following error
    
      - Translation failed - An error occurred (AccessDeniedException)
        when calling the TranslateText operation: User:
        arn:aws:sts::984925612921:assumed-role/lambda-translate-role-cqrhftc4/**lambda-translate
        is not authorized to perform: translate:TranslateText**\\

## Set IAM permission for Lambda function to access Translate service

  - Click on Permissions and the role name

![](.//media/image4.png)

  - Click on Attach Policy

![](.//media/image5.png)

  - Type Translate and select the Policy TranslateFullAccess, and click
    on Attach Policy

![](.//media/image6.png)

  - After this change, click again on Test

  - This time we can see that the Lambda function returns the proper
    object

![](.//media/image7.png)

##  Create the API Gateway 

  - From the AWS Console Manager type API and select API Gateway

  - Create API

  - Click Build for the panel REST API

![](.//media/image8.png)

  - Give a name to the API, select Endpoint Type equal to Edge optimized
    and click on Create

![](.//media/image9.png)

  - In the next page click Action + create resource to create the
    endpoint that will be linked to

![](.//media/image10.png)

  - Type a resource name and tick Enable API Gateway CORS, then click on
    Create Resource

![](.//media/image11.png)

  - With the newly created /translate resource selected, from the Action
    dropdown select Create Method.

<!-- end list -->

  - Select POST from the new dropdown that appears, then click the
    checkmark.

  - Select Lambda Function for the integration type as the Lambda
    function created before and click Save + click OK

![](.//media/image12.png)

![](.//media/image13.png)

  - Click then on Test

![](.//media/image14.png)

  - In Request Body type the JSON used to test the Lambda function

{

"sourceText": "Bonjour",

"lang": "it"

}

  - Click on Test and check the outcome

  - Test was successful because Bonjour was translated correctly

![](.//media/image15.png)

  - Click on Action + Deploy API

![](.//media/image16.png)

  - Select \[New Stage\] in the Deployment stage entry and fill Stage
    Name + click Deploy

  - Take note of the Invoke URL, e.g.
    
      - https://1234.execute-api.us-east-1.amazonaws.com/dev
    
      - <https://2zzv2bm234.execute-api.us-east-1.amazonaws.com/dev>

## Create an HMTL page that calls the API Gtw endpoint /translate

  - A sample html page that is able to call the endpoint of interest is
    the following
    
      - The same code is within the sample html page
        “doc\_translate.html”

  - **<span class="underline">Remember to put your Invoke URL pointing
    to the endpoint /translate</span>**

\`\`\`

\<\!DOCTYPE html\>

\<html\>

\<head\>

\<meta charset="UTF-8"\>

\<title\>Translation Service\</title\>

\<\!-- Add some CSS to change client UI --\>

\<style\>

body {

background-color: \#232F3E;

}

label, button {

color: \#FF9900;

font-family: Arial, Helvetica, sans-serif;

font-size: 20px;

margin-left: 40px;

}

input {

color: \#232F3E;

font-family: Arial, Helvetica, sans-serif;

font-size: 20px;

margin-left: 20px;

}

div{

color: \#FF9900;

font-size: 20px;

{

\</style\>

\<script\>

// define the callAPI function that takes a first name and last name as
parameters

var callAPI = (text,targetLang)=\>{

// instantiate a headers object

var myHeaders = new Headers();

// add content type header to object

myHeaders.append("Content-Type", "application/json");

// using built in JSON utility package turn object to string and store
in a variable

var raw = JSON.stringify({"sourceText":text,"lang":targetLang});

// create a JSON object with parameters for API call and store in a
variable

var requestOptions = {

method: 'POST',

headers: myHeaders,

body: raw,

redirect: 'follow'

};

// make API call with parameters and use promises to get
response

fetch("**https://1234.execute-api.us-east-1.amazonaws.com/dev/translate**",
requestOptions)

.then(response =\> response.text())

.then(result =\> alert(JSON.parse(result).body))

.catch(error =\> console.log('error', error));

}

\</script\>

\</head\>

\<body\>

\<div id="articleLongDescription"\>This page translates an input text
written in French in the desired language leveraging AWS Translate
Service. The target language should be specified via \<a
href="https://docs.aws.amazon.com/translate/latest/dg/what-is.html\#what-is-languages"\>Amazon
language codes\</a\>.\</div\>

\<form\>

\<label\>Type your text in french:\</label\>

\<input type="text" id="source-text"\>

\<label\>Type the target language - e.g. it\</label\>

\<input type="text" id="target-lan"\>

\<\!-- set button onClick method to call function we defined passing
input values as parameters --\>

\<button type="button"
onclick="callAPI(document.getElementById('source-text').value,document.getElementById('target-lan').value)"\>Call
API\</button\>

\</form\>

\</body\>

\</html\>

\`\`\`

  - Open the HMTL page with a browser, type some text in French, type
    the target language and click Call API

  - You should receive back the translated text like below
    
      - Note: in case you do not receive anything click on F12, go to
        Console and retry
    
      - In case you see some error related to the CORS, try to go back
        on AWS to the API page and for the resource /translate do:
        
          - Action + Enable CORS
        
          - Action + Deploy API
        
          - Wait few seconds and retry

Before

![](.//media/image17.png)

After click on Call API

![](.//media/image18.png)

The website can also be hosted on a public S3 bucket.

## Clean-up 

Delete the Lambda Function and the API gtw.
