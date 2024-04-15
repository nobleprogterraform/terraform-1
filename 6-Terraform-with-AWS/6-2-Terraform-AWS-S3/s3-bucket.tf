terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
  }
  backend "s3" {
    bucket = "test1234finance"
    key = "state/terraform.tfstate"
    dynamodb_table = "test"
    region     = "eu-west-1"
  }
}

provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}

data "aws_iam_user" "test-user" {
    user_name = "test"
}

resource "aws_s3_bucket" "finance" {
    bucket = "${data.aws_iam_user.test-user.user_name}1234finance"
    tags = {
      Description = "Finance documents"
    }
}

resource "aws_s3_object" "upload" {
    bucket = aws_s3_bucket.finance.bucket
    key = "picture"
    source = "picture.jpeg"
}