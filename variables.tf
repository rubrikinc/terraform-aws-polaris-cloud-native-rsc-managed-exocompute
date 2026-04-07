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

variable "rsc_aws_exocompute_cluster_access" {
  type        = string
  default     = null
  description = "EKS cluster access type for the Exocompute configuration. Possible values are EKS_CLUSTER_ACCESS_TYPE_PUBLIC and EKS_CLUSTER_ACCESS_TYPE_PRIVATE."

  validation {
    condition = var.rsc_aws_exocompute_cluster_access == null || contains(
      ["EKS_CLUSTER_ACCESS_TYPE_PUBLIC", "EKS_CLUSTER_ACCESS_TYPE_PRIVATE"],
      var.rsc_aws_exocompute_cluster_access,
    )
    error_message = "Cluster access type must be EKS_CLUSTER_ACCESS_TYPE_PUBLIC or EKS_CLUSTER_ACCESS_TYPE_PRIVATE."
  }
}

variable "aws_exocompute_pod_subnet_1_cidr" {
  type        = string
  default     = null
  description = "Pod subnet 1 CIDR for the AWS account hosting Exocompute."

  validation {
    condition     = var.aws_exocompute_pod_subnet_1_cidr == null || can(cidrhost(var.aws_exocompute_pod_subnet_1_cidr, 0))
    error_message = "Must be a valid CIDR address."
  }
}

variable "aws_exocompute_pod_subnet_2_cidr" {
  type        = string
  default     = null
  description = "Pod subnet 2 CIDR for the AWS account hosting Exocompute."

  validation {
    condition     = var.aws_exocompute_pod_subnet_2_cidr == null || can(cidrhost(var.aws_exocompute_pod_subnet_2_cidr, 0))
    error_message = "Must be a valid CIDR address."
  }
  validation {
    condition     = (var.aws_exocompute_pod_subnet_2_cidr == null) == (var.aws_exocompute_pod_subnet_1_cidr == null)
    error_message = "Pod subnet 1 CIDR and pod subnet 2 CIDR must be specified together."
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
    error_message = "The aws_profile variable has been deprecated. It has no replacement and will be removed in a future release. To continue using an AWS profile, pass the profile to the AWS provider block in the root module."
  }
  assert {
    condition     = var.rsc_credentials == null
    error_message = "The rsc_credentials variable has been deprecated. It has no replacement and will be removed in a future release. To continue using an RSC service account file, pass the file name to the Polaris provider block in the root module."
  }
  assert {
    condition     = var.rsc_exocompute_region == null
    error_message = "The rsc_exocompute_region variable has been deprecated. It has no replacement and will be removed in a future release. The Exocompute region is now the region used by the AWS provider."
  }
}
