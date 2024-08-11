module "US-Payroll-App" {
    source = "../modules/payroll-app"
    app_region = "eu-west-1"
    ami = "ami-0c1c30571d2dae5c9"
    bucket = "sahdev-bucket"
}