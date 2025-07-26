## this is the main logic behind whaat lambda is going to to to activate aws polly. CORE LOGIC.
import boto3
import json
import base64

def lambda_handler(event, context):
    body = json.loads(event["body"])
    text = body.get("text", "Please enter a valid text")

    polly_client = boto3.client('polly')

    response = polly_client.synthesize_speech(
        Text=text,
        OutputFormat='mp3',
        VoiceId='Aditi'
    )

    audio_stream = response['AudioStream'].read()
    audio_base64 = base64.b64encode(audio_stream).decode('utf-8')

    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({"audio": audio_base64})
    }
