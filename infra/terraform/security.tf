resource "aws_security_group" "web_sg" {
  name        = "ca-web-sg"
  description = "Allow SSH from my IP and HTTP from anywhere"  # <-- MATCH EXISTING DESCRIPTION
  vpc_id      = aws_vpc.main.id

  # Manage rules via aws_security_group_rule, and ignore drift so TF won't try to replace.
  lifecycle {
    ignore_changes = [description, ingress, egress]
  }

  tags = {
    Name = "ca-web-sg"
  }
}
