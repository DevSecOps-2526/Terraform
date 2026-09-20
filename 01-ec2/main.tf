resource "aws_instance" "webserver" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_Traffic.id]

  tags = {
    Name = "webserver"
    env  = "test"
  }
}

resource "aws_security_group" "allow_Traffic" {
  name = "web_sg"

  tags = {
    name = "web_sg"
    env  = "test"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
