// hii im writing this because I'll be creating a terraform script to deploy aws polly .
// hi i'm starting the project 
//firstly i started with configuring aws cli by installing it and giving credentials of iam user ie access key, password, region and output format of the code for reading 
// now I'm writing terraform main script that is used for invoking polly through lambda.
//this script will automatically deploy lambda.

provider "aws" {
                region = "us-east-1"
}
// Now ill go to lambda to create an automation script to call polly
// after that i will need to deploy that lambda function using terraform for aws to septup lambda initially

resource "aws_iam_role" "lambda_exec_role" {
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

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "text_to_speech" {
  filename         = "lambda.zip"
  function_name    = "textToSpeechLambda"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "handler.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = filebase64sha256("lambda.zip")
}