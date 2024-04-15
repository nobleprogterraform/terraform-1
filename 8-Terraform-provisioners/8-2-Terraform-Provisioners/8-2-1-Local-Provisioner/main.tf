provider "aws" {
  access_key = ""
  secret_key = ""
  region = "eu-west-1"
}

resource "aws_instance" "ec2-server" {
    ami = "ami-0c1c30571d2dae5c9"
    instance_type = "t2.micro"

    provisioner "local-exec" {
        on_failure = continue
      command = "echo EC2 server ${aws_instance.ec2-server.public_ip} created > temp/ip-address.txt"
    }
  
    provisioner "local-exec" {
        when = destroy
      command = "echo EC2 server ${self.public_ip} destroyed > destroy-info.txt"
    }
}

#1. create instance and log ip address to txt file
#2. add another local provisioner for destroy to log to another file
#3. put wrong directory name for local-exec, see failure in apply command output
#4. destroy resource, added on_failure=continue and run apply to see no failure in command