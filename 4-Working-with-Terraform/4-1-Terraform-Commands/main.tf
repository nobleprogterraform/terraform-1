resource "local_file" "pets" {
  filename = "pets.txt"
  content = "we love pets!"
}


/*
terraform validate
terraform fmt
terraform show
terraform show -json
terraform providers
terraform output
terraform validate var-name

*/