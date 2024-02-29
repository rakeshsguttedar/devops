# This is the first sample terraform script written in HCL [ Hashicorp Configuration Language ]
# This is a comment in hcl. Aslo supports /* multiline comment */ // single line comment

/*  We can also using provider block to specify the region but it is already specified in aws cli
    using aws configure command. Hence this provider block is in this comment.
    provider "aws" {
      region = "us-east-1"  # Set your desired AWS region
    }
 */
 

# main.tf
resource "aws_instance" "ec2_instance" {
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name = "aws-aps-key"
  vpc_security_group_ids = ["sg-0d5b8a73ea7f968ca"]
  tags = {
    Name = "first_instance"
  }
}

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}