resource "aws_instance" "web-server" {
    instance_type = "t2.micro"
    ami = lookup(var.ami, terraform.workspace)
    tags = {
      Description = terraform.workspace
    }
}

In this lecture,
we will learn about workspaces in Terraform
and how to use them.

Earlier in the course, we learned about state
and its use when running Terraform operations.
Whether stored locally
or in remote backend such as S3 and Terraform Cloud,
state is essential in mapping the real-world infrastructure,
allowing Terraform to model what changes it needs to apply
based on the configuration defined in the state files.

Irrespective of whether the state is stored locally or remotely,
all the examples that we have seen so far has one-to-one mapping
between the configuration directory and the state file.

This means that we have had
one Terraform state file per configuration directory so far.

Let us consider a scenario
where we want to create an EC2 instance in the AWS ca-central-1 region
for a new project called ProjectA.
This can be done by making use of a simple configuration file
in a configuration directory called ProjectA

If we run terraform apply now inside this configuration directory,
Terraform will create the EC2 instance as expected.
It will also create a state file.

Now, what if we want to replicate the same configuration
for another project, say, ProjectB,
but with a different AMI ID and a server name as compared to ProjectA.

How do we go about that?
The logical way would be to create a new directory called ProjectB,
copy the configuration files from ProjectA directory,
change the AMI ID and the tags as needed,
and repeat the steps that we did for setting up the ProjectA instance.

However, the goal of using Terraform or any IaC tool for that matter
is to eliminate repeatable steps and efficiently make use of existing code

Terraform offers a feature that allows configuration files within a directory
to be reused multiple times for different use cases,
such as creating a ProjectA
and a ProjectB environment within the same configuration directory.
This feature is called workspace.
With workspaces, we can use the same configuration directory
to create multiple infrastructure environments
such as the ProjectA and the ProjectB environment.

create a workspace: terraform workspace new ProjectA
list workspaces: terraform workspace list
switch workspace: terrform workspace select ProjectB

When using workspaces, instead of using the default terraform.tfstate file
in the configuration directory,

Terraform stores the state file
in a separate directory called terraform.tfstate.d.
Inside this directory,we can see another directory by the name of each workspace
for which we have at least completed one terraform apply.