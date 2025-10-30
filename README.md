# Terraform Module - AWS RSC Managed Exocompute
This module adds an RSC manged Exocompute configuration to the Rubrik Security Cloud.

## Usage

```hcl
module "rsc_managed_exocompute" {
  source  = "rubrikinc/polaris-cloud-native-rsc-managed-exocompute/aws"
  
  aws_exocompute_public_subnet_cidr   = "172.20.0.0/24"
  aws_exocompute_subnet_1_cidr        = "172.20.1.0/24"
  aws_exocompute_subnet_2_cidr        = "172.20.2.0/24"
  aws_exocompute_vpc_cidr             = "172.20.0.0/16"
  rsc_aws_cnp_account_id              = "01234567-89ab-cdef-0123-456789abcdef"
}
```

## Examples
- [Basic Exocompute](examples/basic)
- [With Cloud Native AWS Module](examples/with_cloud_native_aws_module)

# Changelog

## v0.2.1
* Update the with_cloud_native_aws_module example.

## v0.2.0
* Relax the AWS provider version constraint to `>=5.26.0`.
* Relax the RSC (Polaris) provider version constraint to `>=1.0.0`.
* Remove the AWS and RSC (Polaris) provider blocks from the module. These must now be provided in the Terraform root
  module.
* Add module variable validation.
* Add module usage examples.
* Mark the `aws_profile`, `rsc_credentials` and `rsc_exocompute_region` variables as deprecated. They are no longer
  used by the module and have no replacements.
* Add support for specifying additional tags to the resources being created in AWS.
* Fix the cluster and worker egress rules for 0.0.0.0/0 according to the RSC documentation.

## Upgrading
Before upgrading the module, be sure to read through the changelog to understand the changes in the new version and any
upgrade instruction for the version you are upgrading to.

To upgrade the module to a new version, use the following steps:
1. Update the `version` field in the `module` block to the version you want to upgrade to, e.g. `version = "0.2.0"`.
2. Run `terraform init --upgrade` to update the providers and modules in your configuration.
3. Run `terraform plan` and check the output carefully to ensure that there are no unexpected changes caused by the
   upgrade.
4. Run `terraform apply` if there are expected changes that you want to apply.

Note, as variables in the module are deprecated, you may see warnings in the output of `terraform plan`. It's
recommended that you follow the instructions in the deprecation message. Eventually deprecated variables will be
removed.

<!-- BEGIN_TF_DOCS -->


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.26.0 |
| <a name="requirement_polaris"></a> [polaris](#requirement\_polaris) | >=1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=5.26.0 |
| <a name="provider_polaris"></a> [polaris](#provider\_polaris) | >=1.0.0 |

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
| [aws_vpc_security_group_egress_rule.cluster_all_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.cluster_worker_1025_65535](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.worker_all_ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.cluster_worker_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.worker_cluster_1025_65535](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.worker_cluster_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.worker_worker_all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [polaris_aws_exocompute.rsc_managed](https://registry.terraform.io/providers/rubrikinc/polaris/latest/docs/resources/aws_exocompute) | resource |
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
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS profile name. | `string` | `null` | no |
| <a name="input_rsc_aws_cnp_account_id"></a> [rsc\_aws\_cnp\_account\_id](#input\_rsc\_aws\_cnp\_account\_id) | RSC cloud account ID for the AWS account hosting Exocompute. | `string` | n/a | yes |
| <a name="input_rsc_credentials"></a> [rsc\_credentials](#input\_rsc\_credentials) | Path to the Rubrik Security Cloud service account file. | `string` | `null` | no |
| <a name="input_rsc_exocompute_region"></a> [rsc\_exocompute\_region](#input\_rsc\_exocompute\_region) | AWS region for the Exocompute cluster. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to AWS resources created. | `map(string)` | `null` | no |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
