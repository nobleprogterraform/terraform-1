resource "local_file" "hcl-basic" {
    filename = "terraform-hcl"
    content = "Terraform introduction"

    #Step 1 first run without uncomment 
    #Step 2 then uncomment below line and run apply to see resource updating
    #file_permission = "0700"
    #Step 3 now run terraform destroy to see destroying resource
}