resource "local_file" "pets" {
  filename = "pets.txt"
  content = random_string.string.id
}

resource "random_string" "string" {
  length = var.length
  
}

/*
1. Update length variable to see resources getting deleted first and then created
2. Lifecycle rules can be used to change the default behaviour or prevent resources
 from deletion 
3. lifecylce{create_before_destroy=true} on random_string and see its created first
4. prevent_destroy=true on file will not allow you to change length var
5. ignore_changes = [filename] will ignore changes made to filename for recreation
6. A special case when you put create_before_destroy=true in file will result in file
deletion eventually

*/