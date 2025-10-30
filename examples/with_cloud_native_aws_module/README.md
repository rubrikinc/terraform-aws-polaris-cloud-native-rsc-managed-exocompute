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
| <a name="requirement_time"></a> [time](#requirement\_time) | >=0.13.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=5.26.0 |
| <a name="provider_time"></a> [time](#provider\_time) | >=0.13.1 |

## Resources

| Name | Type |
|------|------|
| [time_sleep.wait_for_rsc](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_native"></a> [cloud\_native](#module\_cloud\_native) | rubrikinc/polaris-cloud-native/aws | n/a |
| <a name="module_rsc_managed_exocompute"></a> [rsc\_managed\_exocompute](#module\_rsc\_managed\_exocompute) | ../../ | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID of the account to protect with RSC. | `string` | n/a | yes |
| <a name="input_aws_account_name"></a> [aws\_account\_name](#input\_aws\_account\_name) | AWS account name of the account to protect with RSC. | `string` | n/a | yes |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
