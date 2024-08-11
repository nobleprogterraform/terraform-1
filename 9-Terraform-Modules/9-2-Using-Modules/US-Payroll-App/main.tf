module "US-Payroll-App" {
    source = "../modules/payroll-app"
    app_region = "us-east-1"
    ami = "ami-0c1c30571d2dae5c9"
}