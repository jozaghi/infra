module "vpc" {
  source = "./modules/vpc"
  name = "app-vpc"
  cidr_block = "10.0.0.0/16"
  azs = var.azs
  public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr = ["10.0.101.0/24", "10.0.102.0/24"]
}