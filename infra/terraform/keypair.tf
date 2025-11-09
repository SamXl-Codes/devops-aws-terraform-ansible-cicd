locals {
  # Support secrets stored either as raw SSH keys or base64-encoded strings
  ssh_public_key = trimspace(try(base64decode(var.public_key_base64), var.public_key_base64))
}

resource "aws_key_pair" "main" {
  key_name   = "ca-ssh-key"
  public_key = local.ssh_public_key

  lifecycle {
    ignore_changes = [public_key]
  }
}
