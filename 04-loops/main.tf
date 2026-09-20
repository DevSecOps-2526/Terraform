resource "aws_instance" "webserver" {
  count                  = 3
  ami                    = var.ami_id
  instance_type          = var.environment == "test" ? "t3.micro" : "t3.large"
  vpc_security_group_ids = [aws_security_group.allow_Traffic[count.index].id]

  tags = {
    Name = var.instance_name[count.index]
  }
}

resource "aws_security_group" "allow_Traffic" {
  count = 3
  name  = var.security_group_name[count.index]

  tags = {
    Name = var.security_group_name[count.index]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

