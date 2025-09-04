locals {
  uuid_null  = "00000000-0000-0000-0000-000000000000"
  uuid_regex = "^(?i)[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"
}

variable "aws_exocompute_public_subnet_cidr" {
  type        = string
  description = "Public subnet CIDR for the AWS account hosting Exocompute."

  validation {
    condition     = can(cidrhost(var.aws_exocompute_public_subnet_cidr, 0))
    error_message = "Must be a valid CIDR address."
  }
}

variable "aws_exocompute_subnet_1_cidr" {
  type        = string
  description = "Subnet 1 CIDR for the AWS account hosting Exocompute."

  validation {
    condition     = can(cidrhost(var.aws_exocompute_subnet_1_cidr, 0))
    error_message = "Must be a valid CIDR address."
  }
}

variable "aws_exocompute_subnet_2_cidr" {
  type        = string
  description = "Subnet 2 CIDR for the AWS account hosting Exocompute."

  validation {
    condition     = can(cidrhost(var.aws_exocompute_subnet_2_cidr, 0))
    error_message = "Must be a valid CIDR address."
  }
}

variable "aws_exocompute_vpc_cidr" {
  type        = string
  description = "VPC CIDR for the AWS account hosting Exocompute."

  validation {
    condition     = can(cidrhost(var.aws_exocompute_vpc_cidr, 0))
    error_message = "Must be a valid CIDR address."
  }
}

variable "rsc_aws_cnp_account_id" {
  type        = string
  description = "RSC cloud account ID for the AWS account hosting Exocompute."

  validation {
    condition     = var.rsc_aws_cnp_account_id != local.uuid_null && can(regex(local.uuid_regex, var.rsc_aws_cnp_account_id))
    error_message = "The RSC AWS cloud account ID must be a valid UUID."
  }
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags to apply to AWS resources created."
}

# Deprecated variables.

variable "aws_profile" {
  type        = string
  default     = null
  description = "AWS profile name."
}

variable "rsc_credentials" {
  type        = string
  default     = null
  description = "Path to the Rubrik Security Cloud service account file."
}

variable "rsc_exocompute_region" {
  type        = string
  default     = null
  description = "AWS region for the Exocompute cluster."
}

check "deprecations" {
  assert {
    condition     = var.aws_profile == null
    error_message = "The aws_profile variable has been deprecated. It has no replacement and will be removed in a future release."
  }
  assert {
    condition     = var.rsc_credentials == null
    error_message = "The rsc_credentials variable has been deprecated. It has no replacement and will be removed in a future release."
  }
  assert {
    condition     = var.rsc_exocompute_region == null
    error_message = "The rsc_exocompute_region variable has been deprecated. It has no replacement and will be removed in a future release."
  }
}
