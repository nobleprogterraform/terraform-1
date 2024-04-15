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
    key_name = aws_key_pair.public-key.id
    vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

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

#ssh-key gen -b 4097 -t rsa -f my-key
#ssh -i my-key ubuntu@public_ip
#systemctl