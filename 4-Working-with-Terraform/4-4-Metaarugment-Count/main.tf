resource "local_file" "pets" {
  filename = var.filename
  content = "We love pets"
  count = 2
}

/*
1. count is used when we want to repeat the resource actions in config
2. count = 3 will just create the same file 3 times
3. when using count=3, update filname variable to list and use count.index 
to read from var.filename
4. Now we add another item in array,terraform will not create resource as count 
is static, update count to lenght(var.filename) to make it dynamic

5. Look at the output of apply and see resource are created by index 
6. This will create problem when you delete first entry from list, 
terraform will recreate all other resources because it maintains them
by index
*/