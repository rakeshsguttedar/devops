provider "aws" {
    region = "us-east-1"
}

variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t3.large"
  }
}

variable "ami" {
    description = "This is the AMI for the instance"
}

variable "ssh_key_name" {
    description = "This is the key value pair for ssh into EC2 instance"
}

module "ec2_instance" {
    source = "./modules/ec2_instance"
    ami = var.ami
    instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
    ssh_key_name = var.ssh_key_name
}