/*
===========AWS Dynamo DB=================
DynamoDB is a no SQL database solution provided by AWS.
It is a highly scalable database that can cope with millions
of requests from applications such as mobile and web.

Dynamodb is a no SQL database.
This means that it stores data in the form of key-value pairs
and documents.

In order to uniquely distinguish an item with every other item
in the table, DynamoDB uses a primary key.
*/

provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}

data "aws_iam_user" "test-user" {
    user_name = "test"
}

resource "aws_dynamodb_table" "dynamodb-table" {
    name =  "${data.aws_iam_user.test-user.user_name}-cars"
    hash_key = "VIN"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "VIN"
      type = "S"
    }

}

resource "aws_dynamodb_table_item" "dynamo-table-item"{
    table_name = aws_dynamodb_table.dynamodb-table.name
    hash_key = aws_dynamodb_table.dynamodb-table.hash_key
    item = file("table-item.json")
}