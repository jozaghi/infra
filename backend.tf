terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"      # Replace later
    key            = "global/s3/terraform.tfstate"     # Replace later
    region         = "us-west-2"
    dynamodb_table = "my-terraform-lock-table"         # Replace later
    encrypt        = true
  }
}
