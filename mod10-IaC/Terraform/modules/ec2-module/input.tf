variable "instance-type" {
  type        = string
  description = "Type of the VM instance"
  default     = "t2.micro"
}

variable "ami-id" {
  type        = string
  description = "Amazon Machine Image id"
  default     = "ami-01234567890123456"
}