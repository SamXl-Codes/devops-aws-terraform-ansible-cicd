variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "public_key_path" {
  type = string
  # this is the SSH public key you generated earlier
  default = "~/.ssh/aws-ca.pub"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR format for SSH"
  type        = string
  default     = "0.0.0.0/0" # we will override with your real IP shortly
}
