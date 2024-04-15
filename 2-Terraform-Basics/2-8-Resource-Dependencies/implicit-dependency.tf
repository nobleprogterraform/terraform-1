

resource "local_file" "file" {
  filename = "pets.txt"
  content = "My fav pet is ${random_pet.pet.id}"
}

resource "random_pet" "pet" {
  prefix = "Mr"
  length = 1
  separator = "."
}

/*
1. Implicit dependency: Terraform maintains implicity dependency by looking at 
resource attributes used by other resources. It creates and destroy resources
based in order of dependencies
2. Explicit dependency: depends_on attribute

*/