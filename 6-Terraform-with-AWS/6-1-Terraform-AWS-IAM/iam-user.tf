/*
===========AWS Introduction===========
AWS is one of the most
popular cloud computing platforms in the world.

AWS offers hundreds of services,
significantly higher than any other cloud provider,
from infrastructure technologies like compute,
storage, and databases etc.

AWS has the most extensive global cloud infrastructure.
This allows us to deploy services
in a number of different globally distributed regions
and within it multiple data centers known as availability zones.

Terraform as an IaC tool is created by HashiCorp,
which is an active member of the Amazon Partner Network
and is also currently an Advanced Tier Technology Partner
Terraform offers a dedicated AWS provider for the purpose
of provisioning and managing AWS cloud-based services.
With HCL,
users can write configuration files using simple
human-readable format that can be versioned,
checked in to source control
and easily distributed for reusability.

We will start working with AWS resources from now on.
Along the way, we will learn more Terraform concepts.
But first, we will familiarize ourselves with the AWS platform.
For that, we will first learn how to get started with AWS
and set up an AWS account.

2. Setup an AWS Account
In order to work with AWS services we need to have AWS account created first.
For this course I have created a free tier account myself for demonstration purpose, so
we will use the free tier account to provision resources on AWS platform.
But in case you want to create an AWS you can create yourself and work on these labs 
using your own account. I can give you high level idea about how to create account in AWS.

Once we have our account, We can see AWS Management Console.
We can see all the services offered by AWS,
click on the Services tab on the top left.
As you can see,
there are plenty of services listed here
which are grouped under several categories.
Under compute, we can see services like EC2,
Lambda etc.
Under storage, we can see services
like S3, EFS, storage gateway.
Under databases,
we have DB such as the RDS
and dynamoDB.

=========Introduction to IAM================
- When we initially sign up for AWS we get an admin account with complete 
administrative privileges. This account is also known as root account. 
You can manage any service within AWS using the root account, but this
is not the recommended approach.

This user account can be compared to the root user in Linux and admin
user in Windows, which have complete administrative privileges to carry
out any task in the operating system.

However, using the root account, we can create new users and assign
them appropriate privileges.
That should be the only purpose of using the root account.


==============AWS IAM with Terraform================
To start off, let us create a new users called test.
When we create users in AWS, there are two types of access that we can
configure; access to the management console and programmatic access.
To access the management console, a user should have a
valid username and a password.
The programmatic access is used to interact programmatically by
using command-line interfaces such as the terminal on Linux
and Mac or PowerShell in Windows.
To do this, we create an access key ID and a secret access key.
We will make use this access key id and secret access key while creating
resources in aws using terraform.

Now let us see how to assign permissions to these users.
As a standard, when a user is just created, AWS assigns least
privilege permission to the user.
What a user can or cannot do in AWS is decided by the permissions that
are defined within an IAM policy.
*/

provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}


resource "aws_iam_user" "test-user" {
  name = "test"
}

/*
First lets explore the documentation of aws_iam_user resource type in terraform registry.
Now lets create AWS iam user. 
Now if we run terraform plan command we see error about credentials .
We can either hard code access key id, secret-access-key and region in provider block or
we can provide env variables using export AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_REGION 

Now lets create a policy in AWS so that we can refer to this policy and attach policy to newly created user
Now lets attache policy to the user

*/

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
