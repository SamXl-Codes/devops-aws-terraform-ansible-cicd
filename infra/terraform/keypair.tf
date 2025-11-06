variable "public_key_base64" {
  description = "Base64-encoded public key for EC2 key pair"
  type        = string
}

resource "aws_key_pair" "main" {
  key_name   = "ca-ssh-key"
  public_key = base64decode(var.public_key_base64)

  lifecycle {
    ignore_changes = [public_key]
  }
}
