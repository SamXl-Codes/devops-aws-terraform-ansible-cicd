resource "aws_key_pair" "main" {
  key_name   = "ca-ssh-key"
  public_key = file(var.public_key_path)
}
