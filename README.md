# AWS Terraform Infrastructure Project

This project sets up a production-grade infrastructure on AWS using Terraform. It includes:

- VPC with subnets
- ECS Fargate (Frontend & Backend)
- RDS (PostgreSQL)
- Load Balancer
- S3
- Secrets Manager
- CloudWatch Monitoring
- Terraform remote state backend (S3 + DynamoDB)

## Getting Started

1. Install Terraform (>= 1.3.0)
2. Create `terraform.tfvars` with your AWS region:
   ```hcl
   aws_region = "us-west-2"
