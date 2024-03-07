# Terraform remote backend using S3 bucket to store the terraform statefile
/*
terraform {
  backend "s3" {
    bucket         = "tf-rem-bkend-s3-bkt-for-statefile"
    key            = "tf/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
*/