

data "local_file" "os-version" {
    filename = "os-version.txt"
  
}

output "os-version-value" {
  value = data.local_file.os-version.content
}

/*
1. To read attributes from resources managed outside of terraform
we need to append data before reading attribute
2. Terraform documentation from registry gives good information about
what attributes can be used as part data source
*/