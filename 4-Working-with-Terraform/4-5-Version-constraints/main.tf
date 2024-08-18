
terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "<2.5.1"

        #"!=2.5.1", ">2.5.1", ">1.2.0, <2.0.0, !=1.4.0"
    }
  }
}

resource "local_file" "pets" {
  filename = "pets.txt"
  content = "content"
}

/*
1. By default terraform downloads the latest version
2. we can restrict the version we want to download
3. Version contraints:
    !=2.5.1
    <2.5.0
    >2.5.0
    >1.2.0,<2.0.0,!=1.4.0
    
*/