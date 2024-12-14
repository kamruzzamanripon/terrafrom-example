variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0e2c8caa4b6378d8c"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "key_path" {
  description = "Path to the public key"
  default     = "H:/access_key/ec2_access.pub"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  default     = 1
}
