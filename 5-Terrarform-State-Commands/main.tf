resource "random_string" "string" {
    length = 5
}

/*
1. terraform state list (just the resource address)
2. terraform state list random_string.string  (just resource address)
3. terraform state show (detailed info about resource)
4. terraform state mv random_string.string random_string.string-1 (just to 
    rename the resource without having to recreate, remember to manual renaming
    in config file)
5. terraform state pull (show latest state)
6. terraform state rm random_string.string (remove resource from state only
    not from infra)
*/