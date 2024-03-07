provider "aws" {
    region = "us-east-1"
}

variable "instance_type" {
    description = "This is the instance type"
}

variable "ami" {
    description = "This is the AMI for the instance"
}

variable "ssh_key_name" {
    description = "This is the key value pair for ssh into EC2 instance"
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.ssh_key_name
}

