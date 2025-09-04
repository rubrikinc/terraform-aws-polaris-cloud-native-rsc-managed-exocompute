terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.26.0"
    }
    polaris = {
      source  = "rubrikinc/polaris"
      version = ">=1.0.0"
    }
  }
}

variable "example_account_id" {
  type        = string
  description = "RSC cloud account ID for the AWS account hosting Exocompute."
}

provider "aws" {}

provider "polaris" {}

module "rsc_managed_exocompute" {
  source = "../../"

  aws_exocompute_public_subnet_cidr = "172.20.0.0/24"
  aws_exocompute_subnet_1_cidr      = "172.20.1.0/24"
  aws_exocompute_subnet_2_cidr      = "172.20.2.0/24"
  aws_exocompute_vpc_cidr           = "172.20.0.0/16"
  rsc_aws_cnp_account_id            = var.example_account_id

  tags = {
    Environment = "test"
    Example     = "basic"
    Module      = "terraform-aws-polaris-cloud-native-rsc-managed-exocompute"
  }
}
