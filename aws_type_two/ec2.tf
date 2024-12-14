resource "aws_key_pair" "access_key" {
  key_name   = "access_key"
  public_key = file(var.key_path)
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "allow_user_to_connect" {
  name        = "allow-TLS-${timestamp()}"
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

# resource "aws_instance" "test_instance" {
#   for_each = { for i, config in var.ec2_config : i => config }

#   ami           = each.value.ami
#   instance_type = each.value.instance_type

#   root_block_device {
#     volume_size = each.value.volume_size
#     volume_type = "gp3"
#   }

#   tags = {
#     Name = "Automate-${each.key + 1}" # Dynamically generate names with indices
#   }
# }



resource "aws_instance" "test_instance_from_map" {
  for_each = var.ec2_map

  ami           = each.value.ami
  instance_type = each.value.instance_type

  root_block_device {
    volume_size = each.value.volume_size
    volume_type = "gp3"
  }

  tags = {
    Name = "Automate-${each.key}"
  }
}
