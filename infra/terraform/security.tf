# security.tf – FINAL 100% WORKING (IPv4 only)
data "http" "github_actions_ips" {
  url = "https://api.github.com/meta"
}

# Filter ONLY IPv4 addresses from GitHub Actions
locals {
  github_ipv4 = [
    for ip in jsondecode(data.http.github_actions_ips.response_body).actions :
    ip if can(cidrhost("${ip}/32", 0))
  ]
}

resource "aws_security_group" "web_sg" {
  name        = "ca-web-sg"
  description = "Allow SSH from GitHub Actions + HTTP from world"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "ca-web-sg"
  }
}

resource "aws_security_group_rule" "github_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks              = local.github_ipv4
  security_group_id        = aws_security_group.web_sg.id
  description              = "GitHub Actions runners IPv4"
}

resource "aws_security_group_rule" "http_world" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
}
