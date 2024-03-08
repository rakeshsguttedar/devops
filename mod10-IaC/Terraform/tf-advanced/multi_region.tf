# multi region providers - multi_region.tf
# rename this file to main.tf for testing

# using alias keyword, implement multi region infrastructure setup in terraform
provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias = "ap-south-1"
  region = "ap-south-1"
}

resource "aws_instance" "useast1" {
  ami = "ami-07d9b9ddc6cd8dd30"
  instance_type = "t2.micro"
  provider = aws.us-east-1
}

resource "aws_instance" "apsouth1" {
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  provider = aws.ap-south-1
}