resource "local_file" "pets" {
  filename = each.value
  content = "We love pets"
  for_each = var.filename
}

/*
1. For each does not support list of string, only set of map of strings

2. Look at the output of apply and see resource are created by keys 
3. If we delete first entry from set then terraform will not recreate other
resources
*/