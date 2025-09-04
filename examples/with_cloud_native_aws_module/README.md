# With Cloud Native AWS Module
The configuration in this directory shows how to use this module together with the `rubrikinc/polaris-cloud-native/aws`
module to onboard an AWS account to RSC and create an RSC managed Exocompute configuration.

## Usage
To run this example you need to execute:
```bash
$ terraform init
$ terraform plan
$ terraform apply
```
Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these
resources.

<!-- BEGIN_TF_DOCS -->


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=5.26.0 |
| <a name="requirement_polaris"></a> [polaris](#requirement\_polaris) | >=1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Resources

| Name | Type |
|------|------|
| [time_sleep.wait_for_rsc](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rsc_aws_cloud_native"></a> [rsc\_aws\_cloud\_native](#module\_rsc\_aws\_cloud\_native) | rubrikinc/polaris-cloud-native/aws | >=1.0.0 |
| <a name="module_rsc_managed_exocompute"></a> [rsc\_managed\_exocompute](#module\_rsc\_managed\_exocompute) | ../../ | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID of the account to protect with RSC. | `string` | n/a | yes |
| <a name="input_aws_account_name"></a> [aws\_account\_name](#input\_aws\_account\_name) | AWS account name of the account to protect with RSC. | `string` | n/a | yes |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS profile to use with the RSC account. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS regions to protect with RSC. | `string` | n/a | yes |
| <a name="input_rsc_credentials"></a> [rsc\_credentials](#input\_rsc\_credentials) | Path to the RSC service account file. | `string` | n/a | yes |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
