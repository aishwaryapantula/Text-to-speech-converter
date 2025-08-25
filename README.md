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
Prerequisits for Interview .
