variable "name" {
    description = "Prefix for all VPC resources"
    type        = string
}

variable "cidr_block" {
    description = "The CIDR block for the VPC"
    type        = string
}

variable "azs" {
    description = "Availability Zones for the VPC"
    type        = list(string)
}

variable "public_subnet_cidr" {
    description = "Public Subnets for the VPC"
    type        = list(string)
}

variable "private_subnet_cidr" {
    description = "Private Subnets for the VPC"
    type        = list(string)
}
