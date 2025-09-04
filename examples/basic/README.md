# Basic RSC Managed Exocompute
The configuration in this directory creates a VPC in AWS and an Exocompute configuration in RSC for RSC managed
Exocompute.

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

No providers.

## Resources

No resources.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rsc_managed_exocompute"></a> [rsc\_managed\_exocompute](#module\_rsc\_managed\_exocompute) | ../../ | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_example_account_id"></a> [example\_account\_id](#input\_example\_account\_id) | RSC cloud account ID for the AWS account hosting Exocompute. | `string` | n/a | yes |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
