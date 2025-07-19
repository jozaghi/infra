module "vpc" {
  source = "./modules/vpc"
  name = "app-vpc"
  cidr_block = "10.0.0.0/16"
  azs = var.azs
  public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr = ["10.0.101.0/24", "10.0.102.0/24"]
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  alb_ingress_ports = [80, 443]
  backend_port = 3000
  db_port = 5432
}