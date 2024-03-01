# main.tf

provider "aws" {
    region = "ap-south-1"
}

/* Data sources is used to fetch the information about existing resources in cloud.
Using UI, we cannot always check the default values. Therefore we use data sources.
Example, fetching existing or default vpc. */

# VPC
data "aws_vpc" "default" {
    default = true
}

# Subnet
data "aws_subnet" "example" {
    vpc_id = data.aws_vpc.default.id
    tags = {
        Name =  "Subnet-B"
    }
}

# Security Group
resource "aws_security_group" "instance_sg" {
    name = "instance_sg"
    description = "security group for ec2 instance"
    vpc_id = data.aws_vpc.default.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" # all protocols allowed
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# resource
resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = data.aws_subnet.example.id
    key_name = var.ssh_key_name
    security_groups = [aws_security_group.instance_sg.id]

    tags = {
        Name = "second_instance"
  }
}

