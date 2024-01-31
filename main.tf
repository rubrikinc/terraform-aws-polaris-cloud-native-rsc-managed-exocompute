data "aws_region" "current" {}

# Temporary fix until this error is resolved:
# │ Error: failed to lookup exocompute config: failed to get vpcs: failed to 
# | request allVpcsByRegionFromAws: graphql response body is an error (status code 200): Objects 
# | are not authorized (code: 403, traceId: x9TBQt14uQpe5tSLU2BDEQ==) | error is

resource "time_sleep" "wait_for_polaris_sync" {
  create_duration = "60s"
}

# Create an Exocompute configuration using the specified VPC and subnets.
resource "polaris_aws_exocompute" "rsc_managed" {
  account_id              = var.rsc_aws_cnp_account_id
# Disabled until bug in provider is fixed.  
#  clusterSecurityGroupID  = aws_security_group.cluster.id
#  nodeSecurityGroupID     = aws_security_group.worker.id
  region                  = data.aws_region.current.name
  vpc_id                  = aws_vpc.rsc_exocompute.id

  subnets = [
    aws_subnet.rsc_exocompute_subnet_1.id,
    aws_subnet.rsc_exocompute_subnet_2.id
  ]

  depends_on = [time_sleep.wait_for_polaris_sync]

}