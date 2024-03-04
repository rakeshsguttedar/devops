Terraform Project 1

Infrastructure Automation

We will create an end to end Terraform project where we automate the creation of 
an EC2 instance, allow access to it and then deploy a small container inside the 
EC2 instance and access the application running inside this container from the browser.

Prerequisites:

Install Terraform  - ref terraform-basics
Install aws cli    - ref terraform-basics
aws confgiure      - to add access keys for using shared conmfiguration with terraform
Visual studio code - for editing terraform configuration files and for managing the
                     complete terraform lifecycle (using Terminal)

TERRAFORM RESOURCES BREAKDOWN

What resources are needed to be created for this setup?
What are some dependencies or what is the order of creation of resources?
Is there any order we need to follow for creating resources? 

Here is the breakdown of the whole project:

We will first create a VPC and then we will create a Subnet inside this VPC.
Once Subnet is created, we will create an EC2 instance inside this subnet. 
How can we access the EC2 instance inside the subnet.? For accessing this EC2
imstance, we will need
a. Route table
b. Internet Gateway

To access the application deployed on the EC2 instance, we need to create a security
group resource. Inside this security Group, we will open 2 ports. Port 22 will be 
opened to allow ssh access and port 8080 for allowing access to nginx server application
which is running inside a docker container. Installing docker inside the EC2 instance will
be done through Terraform.

We need to create a key pair which will be used to access EC2 instance.

Coming to the implementation, we are going to create resources in the following order
in main.tf terraform script file. 

Note: for simplicity and for bevity, we are not going to create a seperate file for 
variables. We will create all infra resources and variables inside a sinle main.tf 
file. Please refer main.tf file for the following steps:

1. Create VPC and subnet resources

Creating a VPC and a subnet will create a route table inside the VPC
but that route table allows access within the VPC and does not allow
outside access. We need to create an Internet gateway for allowing 
access from outside. 

terraform apply --var-file terraform.tfvars

2. Create Route Table and Internet Gateway

We will create an internet gateway inside the VPC. In the next step, instead 
of creating a new route table, we will use the existing default main route table, 
associate our VPC with this default route table and add the Internet Gateway 
with destination as "0.0.0.0/0" within this default main route table.

To create a default route table, we need to confirm whether the VPC we created has the
default route table associated with it. This is done by command

terraform state show aws_vpc.myapp_vpc
Check whether default_route_table_id is present in this vpc.

Now update the main.tf file and run terraform apply
terraform apply --var-file terraform.tfvars

3. Create a Security Group (a firewall for EC2 instance)

We are going to use the default security group and open the ports 22 and 8080 within 
this default security group using ingress and egress blocks.

terraform apply --var-file terraform.tfvars

4. Create an EC2 instance

Before we create an EC2 instance using Terraform, we need to have an AMI or Amazon
Machine Image Identifier. This AMI is used to select the virtual machine image from
the list provided by AWS. (instead of using a hard-coded ami value)

5. Create an SSH key pair for accessing the AWS EC2 instance VM

We need to create ssh keys using ssk-keygen to create private key and a public key. 
Public key will be copied to the EC2 instance through terraform script. 

ssh-keygen -t rsa <press enter for all prompts to select defaults>

Terraform script:

# Add the file name and its path to terraform.tfvars file.
public_key_location = "~/.ssh/id_rsa.pub" 

# Add to main.tf
resource "aws_key_pair" "ssh-key" {
    key_name   = "myapp-key"
    public_key = file(var.public_key_location)

}

terraform apply --var-file terraform.tfvars

Run terraform apply and access the launched EC2 instance using

ssh ubuntu@13.201.84.176

6. Install docker, deploy docker image and run this image inside docker container.

Create an entrypoint.sh shell script for installing of docker and nginx image. This
sshell script has commands to install docker and run the docker container image
of nginx server. 

We then execute this file inside the launched EC2 instance using user_data attribute.

In Terraform, the user_data attribute is used to pass data to an instance at launch time.
For example, you might use user_data to install a web server or database server when 
an instance is launched.

user_data = file("entrypoint.sh")



