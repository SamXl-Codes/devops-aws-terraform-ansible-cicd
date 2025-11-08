# security.tf – ONLY THIS FILE
resource "aws_security_group" "web_sg" {
  name        = "ca-web-sg"
  description = "Allow SSH from GitHub Actions + HTTP from world"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "ca-web-sg"
  }
}

# AUTO-ADD GITHUB ACTIONS IPs (THIS IS YOUR ORIGINAL PERFECT CODE)
resource "aws_security_group_rule" "github_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks              = [for ip in jsondecode(data.http.github_actions_ips.response_body).actions : ip]
  security_group_id        = aws_security_group.web_sg.id
  description              = "GitHub Actions runners"
}

# HTTP open to world
resource "aws_security_group_rule" "http_world" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}

# All outbound
resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}
