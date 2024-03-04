
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  //instance_type = local.instance_type
  instance_type = var.instance-type
  ami           = var.ami-id
}

# locals {
#   instance_type = "t2.large"
# }

/*
When we use locals block in modules, the values set using
local.variable_name cannot be overriden in the terraform
configuration that is using this module.
*/