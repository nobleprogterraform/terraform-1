

/*
terraform state list (just the resource address)
terraform state list aws_dynamodb_table.cars (just resource address)
terraform state show  aws.cars (detailed info about resource)
terraform state mv random_pet.pet-1 random_pet.super-pet (just to 
    rename the resource without having to recreate, remember to manual renaming
    in config file)
terraform state pull (show latest state)
terraform state rm local_file.file (remove resource from state only
    not from infra)

*/