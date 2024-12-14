variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-east-1"
}

variable "key_path" {
  description = "Path to the public key"
  default     = "H:/access_key/ec2_access.pub"
}

variable "ec2_config" {
  type = list(object({
    ami           = string
    instance_type = string
    volume_size   = number
  }))
}

variable "ec2_map" {
  type = map(object({
    ami           = string
    instance_type = string
    volume_size   = number
  }))
}
