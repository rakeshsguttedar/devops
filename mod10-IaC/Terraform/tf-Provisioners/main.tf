provider "aws" {
  region = var.AWS_REGION
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "My VPC"
  }
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.myvpc.id

  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  /* map_public_ip_on_launch: This is so important. The only 
     difference between private and public subnet is this line. 
     If it is true, it will be a public subnet, otherwise private. 
  */
  map_public_ip_on_launch = true # to make it a public subnet
  tags = {
    Name = "Demo_subnet"
  }
}

# create an Internet gateway to allow access to our VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Demo_igw"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# associate the route table with the subnet
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "tf-demo-ssh-pub-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "webSG" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "web" {
  ami                    = "ami-03f4878755434977f"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ssh-key.key_name
  vpc_security_group_ids = [aws_security_group.webSG.id]
  subnet_id              = aws_subnet.sub1.id

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  # file provisioner
  # Copies the myapp.conf file to /etc/myapp.conf
  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  # local-exec provisioner
  provisioner "local-exec" {
    //working_dir = "~/"
    //command = "ssh-keygen -q -t rsa -N '' <<< $'\ny' >/dev/null 2>&1"
    //command ?echo "failed" : echo "success"
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote-exec'",
      "sudo apt update -y",
      "sudo apt-get install python3-pip -y",
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py"
    ]
  }

  tags = {
    Name = "Provisioners EC2"
  }
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

