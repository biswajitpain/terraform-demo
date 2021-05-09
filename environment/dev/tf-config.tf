
provider "aws" {
  version = "~> 3.0"
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::193930899377:role/OrganizationAccountAccessRole"
    session_name =  "dev"
  }
}