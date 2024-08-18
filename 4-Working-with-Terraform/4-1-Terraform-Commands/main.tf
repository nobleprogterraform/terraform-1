resource "local_file" "pets" {
  filename = "pets.txt"
  content = "we love pets!"
}

/*
1. terraform --version
2. terraform init
3. terraform plan
4. terraform apply

5. terraform validate
6. terfaform fmt
7. terraform show
8. terraform providers
9. terraform output
10 terraform output variable-name
*/