resource "aws_security_group" "flask_server_sg" {
  name_prefix = "dele-"

  tags = {
    name = "flask_server_sg"
  }
}

resource "aws_security_group_rule" "http_inbound" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.flask_server_sg.id
}

resource "aws_security_group_rule" "ssh_inbound" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.flask_server_sg.id
}

resource "aws_security_group_rule" "flask_inbound" {
  type        = "ingress"
  from_port   = 5000
  to_port     = 5000
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.flask_server_sg.id
}

resource "aws_security_group_rule" "outbounds" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.flask_server_sg.id
}