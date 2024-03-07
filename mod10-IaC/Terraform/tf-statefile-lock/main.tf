provider "aws" {
  region = "ap-south-1"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "ami_id" {
    default = "ami-03f4878755434977f"
}

variable "ssh_key_name" {
    default="aws-aps-key"
}

# AWS EC2 resource
resource "aws_instance" "ec2_instance" {
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = var.ssh_key_name

    # To add a name to EC2 instance
    tags = {
        Name = "EC2-Resource"
    }
}

# Remote backend configuration
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "tf-rem-bkend-s3-bkt-for-statefile" # change this
}

# dynamodb table to lock the terraform statefile
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
