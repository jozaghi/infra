variable "name" {
  description = "Base name for ECS cluster and roles"
  type        = string
}

variable "region" {
  description = "aws region (used for policies)"
  type        = string
}
