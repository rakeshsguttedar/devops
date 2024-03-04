provider "aws" {
  region = "ap-south-1"
}

module "example-module" {
  source        = "../modules/ec2-module"
  ami-id        = "ami-03f4878755434977f"
  instance-type = "t2.medium"
}