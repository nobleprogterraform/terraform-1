
resource "local_file" "file" {
  filename = "pets.txt"
  content = "This file is create at ${time_static.timestamp.id}"
}

resource "time_static" "timestamp" {
  
}


/*
1. Here we will link 2 resource with each other by using one resource attribute
in another resource
2. When we run terraform apply for above independent resources we can see id printed
in logs of apply command
3. we can use this id attribute of time_static resource in file resource by using expression syntax
In real world infra also we need to use output of 1 resource as input to other resource
4. As an excercise create random pet resource and use its output id as content of 
local file resource
*/