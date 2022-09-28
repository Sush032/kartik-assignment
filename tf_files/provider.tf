terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.31.0"
    }
  }
  backend "s3" {
    bucket = "upgradprojectbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}

