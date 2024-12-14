resource "aws_key_pair" "access_key" {
  key_name   = "access_key"
  public_key = file(var.key_path)
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_user_to_connect" {
  name        = "allow TLS"
  description = "Allow user to connection"
  vpc_id      = aws_default_vpc.default.id

  egress {
    description = "Allow all outging traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Port 22 allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Port 80 allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Port 443 allow"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-security"
  }

}

resource "aws_instance" "test_instance" {
  count = var.instance_count

  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.access_key.key_name
  security_groups = [aws_security_group.allow_user_to_connect.name]

  tags = {
     Name = "Automate-${count.index + 1}"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }
}