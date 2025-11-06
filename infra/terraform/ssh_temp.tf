resource "aws_security_group_rule" "temp_ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.web_sg.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["89.100.141.145/32"]
  description       = "SSH for current IP"
}
