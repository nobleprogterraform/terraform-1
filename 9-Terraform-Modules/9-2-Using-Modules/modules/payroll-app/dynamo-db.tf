

resource "aws_dynamodb_table" "dynamodb-table" {
    name =  "user_data"
    hash_key = "EmployeeID"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "EmployeeID"
      type = "S"
    }

}