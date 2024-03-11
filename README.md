# Terraform Module - AWS Rubrik Cloud Native Rubrik Security Cloud Managed Exocompute

This module adds a RSC manged Exocompute configuration to the Rubrik Security Cloud.

## Prerequisites

There are a few services you'll need in order to get this project off the ground:

- [Terraform](https://www.terraform.io/downloads.html) v1.5.6 or greater
- [Rubrik Polaris Provider for Terraform](https://github.com/rubrikinc/terraform-provider-polaris) - provides Terraform functions for Rubrik Security Cloud (Polaris)
- [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) - Needed for Terraform to authenticate with AWS

## Usage

```hcl
# Deploy Exocompute configuration with inputs provided separately.

module "polaris-aws-cloud-native-rsc-managed-exocompute" {
  source  = "rubrikinc/polaris-cloud-native-customer-rsc-exocompute/aws"
  
  aws_exocompute_public_subnet_cidr   = "172.20.0.0/24"
  aws_exocompute_subnet_1_cidr        = "172.20.1.0/24"
  aws_exocompute_subnet_2_cidr        = "172.20.2.0/24"
  aws_exocompute_vpc_cidr             = "172.20.0.0/16"
  rsc_aws_cnp_account_id              = "01234567-89ab-cdef-0123-456789abcdef"
  rsc_credentials                     = "../.creds/customer-service-account.json"
  rsc_exocompute_region               = "us-east-1"
}
```

```hcl
# Deploy Exocompute configuration with inputs provided by the polaris-aws-cloud-native module.

module "polaris-aws-cloud-native" {
  source  = "rubrikinc/polaris-cloud-native/aws"
  
  aws_account_name                    = "my_aws_account_hosted_exocompute"
  aws_account_id                      = "123456789012"
  aws_regions                         = ["us-west-2","us-east-1"]
  rsc_credentials                     = "../.creds/customer-service-account.json"
  rsc_aws_features                    = [
                                          "CLOUD_NATIVE_PROTECTION",
                                          "RDS_PROTECTION",
                                          "CLOUD_NATIVE_S3_PROTECTION",
                                          "EXOCOMPUTE",
                                          "CLOUD_NATIVE_ARCHIVAL"
                                        ]
}

module "polaris-aws-cloud-native-rsc-managed-exocompute" {
  source  = "rubrikinc/polaris-cloud-rsc-customer-managed-exocompute/aws"
  
  aws_exocompute_public_subnet_cidr   = "172.20.0.0/24"
  aws_exocompute_subnet_1_cidr        = "172.20.1.0/24"
  aws_exocompute_subnet_2_cidr        = "172.20.2.0/24"
  aws_exocompute_vpc_cidr             = "172.20.0.0/16"
  rsc_aws_cnp_account_id              = module.polaris-aws-cloud-native.rsc_aws_cnp_account_id
  rsc_credentials                     = "../.creds/customer-service-account.json"
  rsc_exocompute_region               = "us-east-1"
}
```

<!-- BEGIN_TF_DOCS -->


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.26.0 |
| <a name="requirement_polaris"></a> [polaris](#requirement\_polaris) | =0.8.0-beta.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.26.0 |
| <a name="provider_polaris"></a> [polaris](#provider\_polaris) | 0.8.0-beta.16 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.10.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.rsc_exocompute_nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.rsc_exocompute](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.rsc_exocompute](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.rsc_exocompute_private_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.rsc_exocompute_public_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.rsc_exocompute_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rsc_exocompute_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.rsc_exocompute_private_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rsc_exocompute_private_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.rsc_exocompute_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.worker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.rsc_exocompute_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.rsc_exocompute_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.rsc_exocompute_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.rsc_exocompute](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ecr_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ecr_dkr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.rsc_exocompute](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_security_group_egress_rule.cluster_worker_1025_65535](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.worker_all_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.cluster_worker_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.worker_cluster_1025_65535](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.worker_cluster_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.worker_worker_all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [polaris_aws_exocompute.rsc_managed](https://registry.terraform.io/providers/rubrikinc/polaris/0.8.0-beta.16/docs/resources/aws_exocompute) | resource |
| [time_sleep.wait_for_polaris_sync](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_exocompute_public_subnet_cidr"></a> [aws\_exocompute\_public\_subnet\_cidr](#input\_aws\_exocompute\_public\_subnet\_cidr) | Public subnet CIDR for the AWS account hosting Exocompute. | `string` | n/a | yes |
| <a name="input_aws_exocompute_subnet_1_cidr"></a> [aws\_exocompute\_subnet\_1\_cidr](#input\_aws\_exocompute\_subnet\_1\_cidr) | Subnet 1 CIDR for the AWS account hosting Exocompute. | `string` | n/a | yes |
| <a name="input_aws_exocompute_subnet_2_cidr"></a> [aws\_exocompute\_subnet\_2\_cidr](#input\_aws\_exocompute\_subnet\_2\_cidr) | Subnet 2 CIDR for the AWS account hosting Exocompute. | `string` | n/a | yes |
| <a name="input_aws_exocompute_vpc_cidr"></a> [aws\_exocompute\_vpc\_cidr](#input\_aws\_exocompute\_vpc\_cidr) | VPC CIDR for the AWS account hosting Exocompute. | `string` | n/a | yes |
| <a name="input_rsc_aws_cnp_account_id"></a> [rsc\_aws\_cnp\_account\_id](#input\_rsc\_aws\_cnp\_account\_id) | Polaris account ID for the AWS account hosting Exocompute. | `string` | n/a | yes |
| <a name="input_rsc_credentials"></a> [rsc\_credentials](#input\_rsc\_credentials) | Path to the Rubrik Security Cloud service account file. | `string` | n/a | yes |
| <a name="input_rsc_exocompute_region"></a> [rsc\_exocompute\_region](#input\_rsc\_exocompute\_region) | AWS region for the Exocompute cluster. | `string` | n/a | yes |

## Outputs

No outputs.


<!-- END_TF_DOCS -->