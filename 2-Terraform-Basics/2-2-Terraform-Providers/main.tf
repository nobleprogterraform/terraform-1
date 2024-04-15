
resource "local_file" "pets" {
  filename = "pets.txt"
  content = "we love pets"
}

/*
1. Terraform follows a plugin based architecture to work hunderds of platforms.
2. Terraform providers are found in terraform registry.
3. There are 3 tiers of providers. 
    1) Official provider which are owned and maintained by hashicorp. local provider is Official
        Also includes major providers eg AWS,Azure, GCP
    2) Partner provider which are maintained by partners which are third party tech companies
        which has gone through partner process with hashicorp. eg Heroku
    3) Community provider: maintained by individual contributors from terraform community
4. Run terraform init command to see plugin downloaded and see terraform logs to
    check organization name and then provider. Terraform init command is safe command 
    which can be run as many times without impacting infra

*/