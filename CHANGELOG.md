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
