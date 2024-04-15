
resource "local_file" "pets" {
  filename = "pets.txt"
  content = "we love pets"
}

/*
1. A config file consist of block and arguments. Block contains information about
infrastructure resources
2. A resource type (local_file) provide 2 bits of info,first is provider (local,before underscore)
2nd is type of resource (file in this case)
Next is resource logical name (pets)
Inside block we provide attributes in key-value pair
Above is an example of resource block, we will see examples of data source block, provider block in coming
3. Terraform workflow: A simple terraform workflow consists of 4 steps:
    1. Write configuration file
    2. Terraform init command (this command will check configuration file and initialize the working dir 
        containing tf files)
    3. Terraform plan command (to see the execution plan by terraform. This shows actions that will be carried
        out by terraform. + symbol denotes creation. Resources are not created yet)
    4. Terraform apply command (it will show execution plan again, ask user confirmation and deploy the resources)
        We can use terraform show command to see resources

4. How to know what are the providers, resource types and arugments expected by them, we can look at terraform registry
5. We can have as many configuration files in a directory (ending with .tf) and as many resource blocks in a single config file

*/