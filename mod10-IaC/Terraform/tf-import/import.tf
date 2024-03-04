provider "aws" {
    region = "us-east-1"
}

import {
    to = aws_security_group.mysg
    id = "sg-09e429631952a5913"
}
