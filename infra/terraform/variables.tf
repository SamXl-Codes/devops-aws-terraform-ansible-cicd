variable "public_key_base64" {
  description = "SSH public key (raw or base64-encoded)"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "my_ip_cidr" {
  description = "Your public IP for SSH access"
  type        = string
  default     = "0.0.0.0/0"   # temporary – will be fixed by GitHub secret later
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
