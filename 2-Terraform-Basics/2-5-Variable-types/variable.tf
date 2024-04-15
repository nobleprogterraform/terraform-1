variable "filename" {
  type = string
  description = "name of the file"
  default = "pets.txt"
}

variable "length" {
  type = number
  description = "Length of the password"
  default = 8
}

# additional types
variable "prefix-list" {
  type = list(string)
  description = "prefix list"
  default = [ "Mr.","Mrs.", "Sir" ]
}

variable "prefix-set" {
  type = set(string)
  description = "prefix list"
  default = [ "Mr.","Mrs.", "Sir" ]
}

variable "file-content" {
  type = map(string)
  description = "prefix list"
  default = {
    "statement1": "We love pets",
    "statement2": "I love pets"
  }
}

variable "complex-object" {
    type = object({
      name = string
      age = number
      subjects=list(string)
    })

    default = {
     name= "user1",
     age = 28,
    subjects = ["English", "Maths"]
    }
}

variable "fav-pet" {
    type = tuple([ string,number,bool ])
    default = [ "cat", 1, true ] 
}