# Text-to-speech-converter
Converting text to speech using AWS Polly in integration with Terraform for automating deployment 
Tech Stack :
IAM User
API Gateway
AWS Lambda
AWS Polly
Terraform and Python Scripts 

IMP THING TO REVISE FOR THIS UNDERSTANDING THIS PROJECT :
✅ 1. Terraform Basics
 What is Terraform and its use cases (especially for IaC).

 Terraform CLI commands: init, plan, apply, destroy.

 Structure of a Terraform project (provider block, resource blocks, variables, outputs, etc.).

 Working with .tf and .tfstate files.

 Understanding Terraform state (local & remote).

✅ 2. Provider and Authentication
 Declaring AWS as a provider.

 Setting up credentials (IAM user, aws configure, or environment variables).

 Region selection and understanding its impact.

✅ 3. AWS Resources via Terraform
You already practiced these:

 IAM Roles and Policies (IAM roles, trust policies, and policy attachments).

 Lambda Function Deployment (including zipped code and handler setup).

 API Gateway (v2) — HTTP API integration and route creation.

 Lambda Permissions — for API Gateway to invoke Lambda.

Bonus:

 Learn how to use S3 buckets (optional for deploying larger Lambda packages).

 Add CloudWatch Logs configuration to monitor Lambda output.

✅ 4. Reusability and Clean Code
 Variables (variable.tf): Instead of hardcoding names, use variables.

 Outputs (output.tf): Output the API endpoint URL or Lambda name.

 Modules (optional for now): Break complex infrastructure into reusable pieces.

Example:

hcl
Copy
Edit
variable "lambda_function_name" {
  default = "textToSpeechLambda"
}
✅ 5. State Management & Best Practices
 Understand why .tfstate is important.

 (Optional) Learn remote state (e.g., storing state in S3 with state locking using DynamoDB).

 Use .terraformignore and .gitignore wisely.

 Know about terraform fmt (formatting) and terraform validate (basic error checking).

✅ 6. Debugging & Troubleshooting
 Read error logs in Terraform output.

 Use terraform plan carefully to avoid unwanted changes.

 Know how to destroy only specific resources (e.g., terraform destroy -target=aws_lambda_function.text_to_speech).

✅ 7. CI/CD Automation (optional but cool!)
If you're using GitHub:

 Automate Terraform deployment using GitHub Actions.

 Store secrets (AWS keys) safely in GitHub secrets.

✅ 8. Documentation & Communication
 Comment your Terraform code clearly (you've already done this well!).

 Write a short README.md for your project repo explaining:

What the project does.

How to run terraform init, apply.

The structure of your files.

How the Lambda function works.

Bonus Learning Ideas (if you're curious):
 Terraform Workspaces (for managing multiple environments like dev and prod).

 Use for_each and count for dynamically creating multiple resources.

 locals and data blocks for better optimization and importing existing resources.

📌 Summary
You already know:

Writing core resources

Deploying Lambda + API Gateway

IAM + policies

To level up, learn about:

Variables, outputs

Terraform state

CI/CD (optional but impressive)

Debugging and structure best practices

If you learn those, you can confidently say:

“I know Terraform well enough to build, manage, and automate real AWS infrastructure.”
Prerequisits for Interview 
 2-3 minutes explanatin :
 1. Project Introduction (Goal)
"The project I worked on was building a Text-to-Speech converter using AWS Polly. The idea was to take text input from users through an API and convert it into natural-sounding speech. I chose to automate the entire infrastructure using Terraform, so that everything — from IAM roles to Lambda and API Gateway — gets deployed consistently in one command."

2. Step 1 – Configuring AWS CLI
"I started by configuring the AWS CLI with the credentials of an IAM user. This allowed Terraform to authenticate with AWS and create resources on my behalf. The IAM user basically had the necessary permissions to provision Lambda, API Gateway, and IAM roles."

3. Step 2 – Creating the IAM Role for Lambda
"Next, I wrote Terraform code to create an IAM role that my Lambda function would assume at runtime. This role had two key policies attached: the basic Lambda execution role for logging into CloudWatch, and Amazon Polly full access so that my Lambda could actually generate speech from text. This separation of roles is important — my IAM user deployed resources, but my Lambda function itself needed its own role to run securely."

4. Step 3 – Lambda Function Setup
"Then I deployed the core Lambda function. I wrote a Python script called handler.py that uses the Boto3 library to call Polly’s synthesize speech API. This script was packaged as a lambda.zip file, since AWS Lambda requires the code to be zipped before upload. In Terraform, I defined the Lambda with its runtime, handler, and linked it to the IAM role created earlier."

5. Step 4 – API Gateway Integration
"To make this accessible, I created an API Gateway using Terraform. I set it up with an HTTP endpoint, specifically a route POST /speak. I then integrated this API with my Lambda function using an AWS Proxy integration, so that whenever someone makes a POST request to the endpoint, it directly triggers my Lambda."

6. Step 5 – Permissions Between API Gateway and Lambda
"One important step was granting API Gateway permission to invoke my Lambda. By default, Lambda is private, so I had to use a Terraform resource called aws_lambda_permission. This explicitly allowed the API Gateway service to trigger my Lambda function, but only from my specific API instance. This ensures security and prevents unauthorized access."

7. End-to-End Flow
"So the flow works like this: a user sends text to the API Gateway endpoint → API Gateway invokes the Lambda function → the Lambda uses its role to call Polly and convert the text to audio → and the output can be returned as speech. Everything is fully automated with Terraform, so I can destroy or redeploy the entire stack at any time."

8. Why This Project is Valuable
"This project demonstrates how Infrastructure as Code simplifies cloud deployments, how different AWS services integrate together, and how IAM roles and permissions play different roles in deployment versus runtime. It also taught me about securing APIs, packaging Lambda functions, and managing resources consistently with Terraform."