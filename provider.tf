terraform {
  required_version = ">=1.5.6"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.26.0"
    }
    polaris = {
      source  = "rubrikinc/polaris"
      version = "=0.8.0-beta.16"
    }
  }
}

provider "aws" {
  region = var.rsc_exocompute_region
}

provider "polaris" {
  credentials = var.rsc_credentials
}
