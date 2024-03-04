
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  instance_type = var.instance-type
  ami           = var.ami-id
}