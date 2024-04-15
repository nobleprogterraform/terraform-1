
provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}

#data "aws_instance" "ec2" {
 #   instance_id = "i-0c054e939f5668367"
#}

#output "ec2" {
 # value = data.aws_instance.ec2.public_dns
#}

resource "aws_instance" "ec2-server"{
    ami = "ami-0c1c30571d2dae5c9"
    instance_type = "t2.micro"
    security_groups = ["default"]
    vpc_security_group_ids = ["sg-0af9440afae05fe20"]
    tags = {
      Name = "ec2-server"
    }
}


#In real world there might be resources created outside terraform eg Ansible or aws
# management console, that we would like to bring under management of terraform.
# using datasource we can not manage resource. To bring resource into terraform we have to 
# use terraform import command

#create an empty block of resource "aws_instance" "name"{} before running import command
# after the command populate attributes by copying from state file
# populate ami, instance_type, security_group, vpc_security_group_ids and tags from attributes
# and then run terraform plan to see no changes needed