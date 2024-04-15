resource "local_file" "file" {
  filename = "pets.txt"
  content = "My fav pet is Cat"
  depends_on = [ random_pet.pet ]
}

resource "random_pet" "pet" {
  prefix = "Mr"
  length = 1
  separator = "."
}

resource "time_static" "timestamp" {
  
}

# we can see local_file and time_static are created in parallel