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