// hii im writing this because I'll be creating a terraform script to deploy aws polly .
// hi i'm starting the project 
//firstly i started with configuring aws cli by installing it and giving credentials of iam user ie access key, password, region and output format of the code for reading 
// now I'm writing terraform main script that is used for invoking polly through lambda.
//this script will automatically deploy lambda.

provider "aws" {
                region = "us-east-1"
}
// now I'll make 3 resources using terraform to deploy aws resources 

// RESOURCE:1 - creating an iam role called lambda_role so that lamda can be run in the next steps 
// only lamda is allowed to access this iam role

resource "aws_iam_role" "lambda_role" { 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}
//RESOURCE: 2 : Attaching basic execution policies for lambda
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
//RESOURCE 3 : Actuall calling lambda to run the main logic which is handler.py
resource "aws_lambda_function" "text_to_speech" {
  filename         = "lambda.zip" // zipped file . Zipping file is neessary as during deployment , unzipped folders arent accepted.
  function_name    = "textToSpeechLambda" //name of lamda function that will appear in aws console
  role             = aws_iam_role.lambda_role.arn //which iam role to activate is decided by the arn of that role
  handler          = "handler.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = filebase64sha256("lambda.zip") 
}
//done
// when you write terraform apply, the main funcrion will create an iam role that would be interpreted by lambda 
// then it will see the policies lambda is subjected to like basic execution policy
//then it will run the text to speech function using lambda, where it it connects to the lambda.tf file which contain handler.py + the dependencies to run it
// when you go to aws console and look at lambda service it will have lambda.zip file which has handler.py + dependency required to run lambda function.