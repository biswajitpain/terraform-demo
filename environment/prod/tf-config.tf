provider "aws" {
  version = "~> 3.0"
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::<account-id>:role/OrganizationAccountAccessRole"
    session_name =  "prod"
  }
}