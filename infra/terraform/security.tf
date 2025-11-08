# security.tf – FINAL 3 RULES ONLY – NO THROTTLING
resource "aws_security_group" "web_sg" {
  name        = "ca-web-sg"
  description = "HTTP + SSH open for final run"
  vpc_id      = aws_vpc.main.id

  tags = { Name = "ca-web-sg" }
}

# SSH OPEN TO WORLD (just for this run)
resource "aws_security_group_rule" "ssh_world" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web_sg.id
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
