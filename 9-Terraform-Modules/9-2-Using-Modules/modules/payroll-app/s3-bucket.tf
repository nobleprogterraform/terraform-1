resource "aws_s3_bucket" "finance" {
    bucket = "${var.app_region}-${var.bucket}"
}