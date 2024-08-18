resource "local_file" "pets" {
  filename = "pets.txt"
  content = "we love pets!"
}

/*
1. Terraform state file is a json structure which maps the real world infrastructure
with the resource definitions in configuration file 
2. See output of terraform apply command, it creates unique id of each resource
For any subsequent apply it does not create the resource again
3. But if we update the state file again, terraform checks state file again 
and create new execution plan based on changes
4. If we delete resources from config file then terraform refers to state file as blueprint
to delete phiysical infra (and also in which order)
5. Terraform state consideration: 
    We should not store the state file in version control as it contains sensitive 
    information about infra. Users can forget to pull latest version from version control which result 
    disastrous actions
    It should be stored in secure storage like Google cloud storage, AWS S3, Azure storage
     

*/

/*
1. Run terraform init,plan and apply to see resource and terraform.tfstate file created
2. Remove a resource from your configuration and see resource deleted from 
terraform state file as well
3. Terraform uses state file to map your resources (in config files) to the real world
infrastructure deployed in remote cloud patforms


*/