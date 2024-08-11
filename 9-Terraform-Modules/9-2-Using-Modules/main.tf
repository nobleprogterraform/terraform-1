In this lecture, let us create a new module in
terraform and then put it to use to deploy multiple environments
of the same infrastructure.

Let us assume that an organization has a blueprint of a prototype payroll
software that needs to be deployed in several countries.

Each country will have its own instance of the software deployed
on AWS Cloud using the same architecture.

It has a single ec2 instance using a custom Ami that
will hold the application server.
A dynamodb no SQL database that will be used to
store the employee and payroll data.
And then we have an S3 bucket, which will be used to
store documents such as pay stubs and tax forms.
Users access the application which is hosted on this ec2
instance.

This is an architecture in its most simplified form
that uses the default VPC and does not
consider things like IAM rules for the services.

So the idea here is to create a reusable terraform
module and use it to deploy the same stack of
resources in different countries.

Since we plan to create a module we created under the

directory called modules. For instance. Let's use
of the path / root terraform projects /
modules.

Inside this we have the resource block
for all the required services such as the ec2 instance S3
bucket and dynamodb.

Now, let's deploy an instance of this application stack
first in the US each one
region.
To do this. Let us create another directory called us payroll app 
To make sure that we deploy to the US East one
region and use the custom Ami ID in
that region

If you enter from in it now, we'll see
that terraform downloads the module from Source along with
the AWS plugin, which is used by that module.
A plan followed by apply will show that the dynamodb tabl
the S3 bucket and the AWS ec2
instance are created

To deploy the same stack in the UK region. Let's create
another directory called UK payroll app.
We then follow the same process of creating a main.tf file
and then make use of the same module block

Modules are comparable to libraries or
packages that are used in most programming languages.
This brings in a lot of benefits such as simpler configuration
instead of having configuration files

