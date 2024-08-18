/*
==============Terraform AWS EC2 instance=================
In this lecture, we will learn about EC2 instances in AWS.
Perhaps one of the most commonly used services from AWS
or any cloud provider for that matter are virtual machines in the cloud.

These virtual machines provide scalable compute
that can be deployed in a matter of minutes.
In AWS, they are called as EC2 instances,
where EC2 stands for elastic compute cloud
and just like any compute, virtual or physical,

an EC2 instance would run an operating system such as a distribution of Linux or windows.
We can then make use of these instances for deploying software such as database,
web servers, application servers
or pretty much anything that you would normally want to deploy in a physical
or virtual machine, which is on premise.

AWS EC2 provides pre-configured templates known as Amazon machine image or AMIs.
These templates contain software configuration such as the operating system
and any additional software to be deployed on these EC2 instances.
Examples are Ubuntu 20.04, RHEL 8, Amazon Linux 2, windows 2019, et cetera.

These AMIs have an ID which is specific to the region where we want to deploy the instance.

EC2 also provides a number of different configurations of CPU,
memory and networking capacity for the instances
which are known as instance types.

There are a wide selection of instance types to choose from
that are optimized to fit different use cases.

NOW lets create the EC2 instance by using aws_instance resource type 
*/

provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}


resource "aws_instance" "web-server" {
    instance_type = "t2.micro"
    ami = "ami-0c1c30571d2dae5c9"
    tags = {
      Description = "EC2 Webserver"
    }
    #key_name = aws_key_pair.public-key.id
    #vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

/*
----------Connecting to instance from local 
All right, so we now have the instance up and running,
but how do we access it from our client machine.
Since this is an Ubuntu EC2 instance,
the logical answer would be for us to make use of an SSH client
and then connect to the server,
but what is the IP address of this machine and how do we allow SSH access to it?
Which SSH key do we use to connect to it?
We have not specified any of these in our Terraform configuration

To do this, we'll make use of another resource type called AWS key pair.
This resource makes use of an existing user supplied key pair
that can be used to control the login access to the EC2 instance.
There's only one mandatory argument called the public key

Now that we have added the key based access control to our configuration,
let us look at the networking that will allow users to connect from the local machine
to the port 22 on our web server via the internet.

For this, we have to make use of another resource type called AWS security group.
Let's call this resource as SSH access.
*/
/*
resource "aws_key_pair" "public-key" {
    key_name = "pub-key"
    public_key = file("my-key.pub")
}

resource "aws_security_group" "ssh-access" {
  name = "ssh-access"
  description = "SSH access to web-server"
  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

output "public-ip" {
  value = aws_instance.web-server.public_ip
}
*/

#ssh-key gen -b 4097 -t rsa -f my-key
#ssh -i my-key ubuntu@public_ip
#systemctl