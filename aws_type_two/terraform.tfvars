aws_region     = "us-east-1"
key_path       = "H:/access_key/ec2_access.pub"

ec2_config = [
  {
    ami           = "ami-0e2c8caa4b6378d8c" # ubuntu
    instance_type = "t2.micro"
    volume_size   = 8
  },
  {
    ami           = "ami-0453ec754f44f9a4a" # amazon linux
    instance_type = "t2.micro"
    volume_size   = 10
  }
]

ec2_map = {
  "ubuntu" = {
    ami           = "ami-0e2c8caa4b6378d8c" # ubuntu
    instance_type = "t2.micro"
    volume_size   = 8
  },
  "amazon-linux" = {
    ami           = "ami-0453ec754f44f9a4a" # amazon linux
    instance_type = "t2.micro"
    volume_size   = 10
  }
}