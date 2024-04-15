provider "aws" {
  access_key = ""
  secret_key = ""
  region = "eu-west-1"
}

resource "aws_instance" "ec2-server" {
    ami = "ami-0c1c30571d2dae5c9"
    instance_type = "t2.micro"

    provisioner "local-exec" {
        on_failure = fail # default behaviour
      command = "echo EC2 server ${aws_instance.ec2-server.public_ip} created > temp/ip-address.txt"
    }
  
}

#1. when a resource creation fails for any reason (like last example where local exec provisioner failed)
    # then terraform marks the resource as tainted (we can see by running plan) and try to replace the whole resource when next apply runs
#2. If we want to mark a resource untaint then run command terraform untaint and it will not replace the resource in next apply
#3. There can be case where we manually want to mark a resource tainted (like manually making an update to remote resource
    # eg updating server version etc and we want to rollback this, one solution is to destroy the resource and recreate it) or
    # we can mark the resource as tainted and terraform can recreate it using terraform apply
    # terraform untaint aws_instance.ec2-server
#4. terraform taint aws_instance.ec2-server

#5. Terraform logging
  # terraform has 5 logging levels: INFO, WARNING,ERROR,DEBUG,TRACE (trace is most verbose)
  # to set a log level (export TF_LOG=TRACE)
  # to save log in files (export TF_LOG=INFO, export_TF_LOG_PATH=terraform.log)
  # to disable log in files (unset TF_LOG_PATH)