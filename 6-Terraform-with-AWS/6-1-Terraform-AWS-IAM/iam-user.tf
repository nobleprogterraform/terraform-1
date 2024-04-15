provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}


resource "aws_iam_user" "test-user" {
  name = "test"
}


resource "aws_iam_policy" "list-user-policy" {
  name   = "ListUserPolicy"
  policy = <<EOF

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "iam:GenerateCredentialReport",
                "iam:GenerateServiceLastAccessedDetails",
                "iam:Get*",
                "iam:List*",
                "iam:SimulateCustomPolicy",
                "iam:SimulatePrincipalPolicy"
            ],
            "Resource": "*"
        }
    ]
}
    EOF
}


resource "aws_iam_user_policy_attachment" "test-user-list-user" {
    user = aws_iam_user.test-user.name
    policy_arn = aws_iam_policy.list-user-policy.arn
}
