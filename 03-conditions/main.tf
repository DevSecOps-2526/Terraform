resource "aws_instance" "webserver" {
  ami                    = var.ami_id
  instance_type          = var.environment == "test" ? "t3.micro" : "t3.large"
  vpc_security_group_ids = [aws_security_group.allow_Traffic.id]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "allow_Traffic" {
  name = var.security_group_name

  tags = {
    Name = var.security_group_name
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

