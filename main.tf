data "aws_region" "current" {}

# Create an Exocompute configuration using the specified VPC and subnets.
resource "polaris_aws_exocompute" "rsc_managed" {
  account_id                = var.rsc_aws_cnp_account_id
  cluster_access            = var.rsc_aws_exocompute_cluster_access
  cluster_security_group_id = aws_security_group.cluster.id
  node_security_group_id    = aws_security_group.worker.id
  region                    = data.aws_region.current.name
  vpc_id                    = aws_vpc.rsc_exocompute.id

  subnets = var.aws_exocompute_pod_subnet_1_cidr == null ? [
    aws_subnet.rsc_exocompute_subnet_1.id,
    aws_subnet.rsc_exocompute_subnet_2.id,
  ] : null

  dynamic "subnet" {
    for_each = var.aws_exocompute_pod_subnet_1_cidr != null ? [
      { subnet_id = aws_subnet.rsc_exocompute_subnet_1.id, pod_subnet_id = aws_subnet.rsc_exocompute_pod_subnet_1[0].id },
      { subnet_id = aws_subnet.rsc_exocompute_subnet_2.id, pod_subnet_id = aws_subnet.rsc_exocompute_pod_subnet_2[0].id },
    ] : []
    content {
      subnet_id     = subnet.value.subnet_id
      pod_subnet_id = subnet.value.pod_subnet_id
    }
  }
}
