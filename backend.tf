terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-arj100"
    key    = "terraform/terraform.tfstate"
    region = "us-west-2"
  }
}