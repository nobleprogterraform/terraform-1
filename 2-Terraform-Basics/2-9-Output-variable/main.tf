resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "my-key" {
  filename = "my-key"
  content = tls_private_key.rsa.private_key_pem
}



output "key" {
  value = tls_private_key.rsa.public_key_pem
}

output "filename" {
  value = local_file.my-key.filename
}

#Output variable are created using expressions
#Bese use for output variables is when you want to display details about resource
# created or you want to feed output variable to another IAC tool 