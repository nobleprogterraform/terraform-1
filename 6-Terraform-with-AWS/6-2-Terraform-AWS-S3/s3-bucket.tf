/*
============AWS S3 object============
S3 stands for Simple Storage Service.
This service provides an infinitely scalable storage solution from AWS.

It also offers high availability of data by storing it
across multiple devices and availability zones in a region.

S3 is an object based storage.
It allows us to store objects or flat files, such as documents,
images, and videos in the AWS cloud.
This is equivalent to a file share storage, such as NFS

Data in S3 is stored in the form of an S3 bucket.
A bucket can be considered to be a container or a directory
which stores all your files.
You can create as many of these buckets as you
need in your AWS account.
Everything within a bucket is an object.

AWS provides a simple web interface to create an S3 bucket
via the Management Console.
When creating a bucket in AWS, there are a couple of
considerations to be followed.

The bucket name must be unique.
This is because when creating a bucket, AWS also
creates a DNS name for it.
This DNS name will be accessible from anywhere in the world.
No two buckets, not even those which are created on different
accounts, can have the same name.

Secondly, the name should also be DNS-compliant.
This means that there should not be any uppercases or underscores
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.45.0"
    }
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