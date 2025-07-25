// hii im writing this because I'll be creating a terraform script to deploy aws polly .
// hi i'm starting the project 
//firstly i started with configuring aws cli by installing it and giving credentials of iam user ie access key, password, region and output format of the code for reading 
// now I'm writing terraform main script that is used for invoking polly through lambda.
//this script will automatically deploy lambda.

provider "aws" {
                region = "us-east-1"
}