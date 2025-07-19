variable "vpc_id" {
    description = "The ID of the VPC to attatch the security group to"
    type = string
}

variable "alb_ingress_ports" {  
    description = "The ports to allow ingress from the ALB SG (e.g. [80, 443])"
    type = list(number)
    default = [80, 443]
}

variable "backend_port" {
    description = "the port backend listens on (e.g. 3000)"
    type = number
}

variable "db_port" {
    description = "the port db listens on (e.g. 5432)"
    type = number
}