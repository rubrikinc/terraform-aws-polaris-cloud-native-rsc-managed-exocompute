data "aws_region" "current" {}

# Create an Exocompute configuration using the specified VPC and subnets.
resource "polaris_aws_exocompute" "rsc_managed" {
  account_id                = var.rsc_aws_cnp_account_id
  cluster_security_group_id = aws_security_group.cluster.id
  node_security_group_id    = aws_security_group.worker.id
  region                    = data.aws_region.current.name
  vpc_id                    = aws_vpc.rsc_exocompute.id

  subnets = [
    aws_subnet.rsc_exocompute_subnet_1.id,
    aws_subnet.rsc_exocompute_subnet_2.id
  ]
}
