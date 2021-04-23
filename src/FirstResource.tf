provider "aws" {
  version = ">= 2.42"
  region  = "us-east-1"
}

data "aws_availability_zones" "azs" {}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-c5e41fb8"
  
  ingress_cidr_blocks = ["10.10.0.0/16"]
}