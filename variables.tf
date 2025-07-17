variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "aws_profile" {
  type = string
  default = "default"
}

variable "azs" {
  type = list(string)
  description = "Availability Zones for the VPC"
}