# AWS Variables

variable "aws_access_key" {
  description = "AWS API token"
}

variable "aws_secret_key" {
  description = "AWS API token"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1" # Cambiar a la región que desees
}

variable "aws_ami" {
  description = "AWS AMI"
  default     = "ami-0fc5d935ebf8bc3bc" # Cambiar a la imagen que desees
}

variable "aws_instance_type" {
  description = "AWS instance type"
  default     = "t2.large" # Cambiar a la instancia que desees
}

variable "aws_key_name" {
  description = "AWS key name"
}