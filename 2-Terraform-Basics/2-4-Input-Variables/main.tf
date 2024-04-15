
resource "local_file" "pets" {
  filename = var.filename
  content = var.content
}

/*
1. We can use variables instead of hardcoding values in config files
2. we can give default value of variable. To use we use var prefix
3. If we need to update resource we can just update variable value 
and terraform will recreate the resource
*/