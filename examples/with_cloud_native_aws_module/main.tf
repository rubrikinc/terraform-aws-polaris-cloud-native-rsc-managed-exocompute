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
    time = {
      source  = "hashicorp/time"
      version = ">=0.13.1"
    }
  }
}

variable "aws_account_id" {
  type        = string
  description = "AWS account ID of the account to protect with RSC."
}

variable "aws_account_name" {
  type        = string
  description = "AWS account name of the account to protect with RSC."
}

provider "aws" {}

provider "polaris" {}

data "aws_region" "current" {}

module "cloud_native" {
  source = "rubrikinc/polaris-cloud-native/aws"

  aws_account_id   = var.aws_account_id
  aws_account_name = var.aws_account_name

  aws_regions = [
    data.aws_region.current.name,
  ]

  rsc_aws_features = [
    {
      name = "CLOUD_NATIVE_PROTECTION"
      permission_groups = [
        "BASIC",
      ]
    },
    {
      name = "EXOCOMPUTE"
      permission_groups = [
        "BASIC",
        "RSC_MANAGED_CLUSTER",
      ]
    },
  ]

  tags = {
    Environment = "test"
    Example     = "basic"
    Module      = "terraform-aws-polaris-cloud-native-rsc-managed-exocompute"
  }
}

# Give RSC some time to propagate all the changes before we try to use the new
# cloud account.
resource "time_sleep" "wait_for_rsc" {
  create_duration = "15s"

  depends_on = [
    module.cloud_native,
  ]
}

module "rsc_managed_exocompute" {
  source = "../../"

  aws_exocompute_public_subnet_cidr = "172.20.0.0/24"
  aws_exocompute_subnet_1_cidr      = "172.20.1.0/24"
  aws_exocompute_subnet_2_cidr      = "172.20.2.0/24"
  aws_exocompute_vpc_cidr           = "172.20.0.0/16"
  rsc_aws_cnp_account_id            = module.cloud_native.rsc_aws_cnp_account_id

  tags = {
    Environment = "test"
    Example     = "basic"
    Module      = "terraform-aws-polaris-cloud-native-rsc-managed-exocompute"
  }

  depends_on = [
    time_sleep.wait_for_rsc,
  ]
}
