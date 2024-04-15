
resource "local_file" "pets" {
  filename = var.filename
  content = lookup(var.file-content, "statement1")
}

/*
1. Variable block can specify type, description and default value of variable
2. Terraform has basic and additional variable types
    1. string, number, bool,any
    2. list,set,map,object,tuple
*/