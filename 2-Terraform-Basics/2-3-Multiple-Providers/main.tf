
resource "local_file" "pets" {
  filename = "pets.txt"
  content = "We love pets!"
}

resource "random_pet" "pet-name" {
  prefix = "Mr"
  length = 1
  separator = "."
}

/*
1. One config file can have many providers and resource types.
2. We need to run init command everytime we add a new provider to initialize
3. When we run terraform plan command, terraform will add only 1 extra resource this time
*/

/*
1. Run terraform init, plan and apply to see provider plugin downloaded with version 
  specified in provider.terraform 
2. Uncomeent line 7-11 and then run terraform plan and apply to see new resource created

*/