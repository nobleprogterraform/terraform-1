
resource "local_file" "pets" {
  filename = var.filename
  content = lookup(var.file-content, "statement1")
}

/*
1. For empty variable blocks, terminal prompts to enter value
2. Command line arguments, -var "filename=pets.txt" -var "content=We love pets"
3. For lot of variable, we can put in .tfvars file eg terraform.tfvars or .auto.tfvars file
4. environment variable, export TF_VAR_filename=pets.txt

Variable precedence:
1. command line flag -var
2. .tfvars or .auto.tfvars
3. environment variables


*/
