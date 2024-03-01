# variable.tf file
# To avoid hardcoding of values in tf script, we use variables

# we can pass value to this instance_type variable from terraform command
# terraform apply -var="instance_type=t2.medium" --auto-approve 
variable "instance_type" {
    default = "t2.micro"
}

variable "ami_id" {
    default = "ami-03f4878755434977f"
}

variable "ssh_key_name" {
    default="aws-aps-key"
}