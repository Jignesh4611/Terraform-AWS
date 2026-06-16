terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "jignesh-terraform-state"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
module "vpc" {
  source = "./modules/vpc"

  project_name       = var.project_name
  region             = var.region
  cidr_block         = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "ec2" {
  source = "./modules/ec2"

  project_name  = var.project_name
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.subnet_id
  instance_type = var.instance_type
}
provider "aws" {
  region = var.region
}