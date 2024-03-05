# This is the first sample terraform script written in HCL [ Hashicorp Configuration Language ]
# This is a comment in hcl. Aslo supports /* multiline comment */ // single line comment

/*  We can also use provider block to specify the region but it is already specified in
    shared configuration files setup with the help of aws cli by using aws configure command. 
    Hence the provider block is commented below. But in real-time work environments, it is a good 
    practice to add a provider block either in main.tf or modules or in a seperate provider.tf file.
    
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
