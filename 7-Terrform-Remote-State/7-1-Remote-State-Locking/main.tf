provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}

terraform {
  backend "s3" {
    bucket = "test1234finance"
    key = "state/terraform.tfstate"
    dynamodb_table = "test-state-locking"
    region = "eu-west-1"
    access_key = ""
    secret_key = ""
  }
}

data "aws_iam_user" "test-user" {
    user_name = "test"
}

resource "aws_dynamodb_table" "state-locking" {
    name = "${data.aws_iam_user.test-user.user_name}-state-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}

resource "local_file" "local-file" {
    filename = "pets.txt"
    content = "We love pets!"
}

/*
1. Purpose of the state file are:
  Mapping to real world infra
  Tracking metadata
  Performance improvement
  Collaboration
2. Local state file does not provide collaboration, but like config files
  state files not be checked in to version control
  Frist it stores sensitive info about infra
  Second if multiple developers are working, then its very important that only
  person works for given same config and state file at a time
3. If 2 people are trying to update the same s3 object at the same time it can
result in curroption of state
4. When working on local terraform protects itself from concurrent operations
 on same config file , this is called state locking
  We can test it by running apply on same config from 2 different terminals
5. Version control softwares like github does not provide state locking
6. Finally users can forget to pull latest state file from version control
7. For these reasons state file is stored in remote secure storage like S3,
Azure or GCP
8. Terraform will automatically pull latest file and push 

*/