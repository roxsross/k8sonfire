provider "aws" {
  region = "us-east-1"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

locals {
  cluster_name = "${cluster_name}"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "${local.cluster_name}"
  cluster_version = "1.22"
  cluster_endpoint_public_access  = true
  vpc_id     = "${vpc_id}"
  subnet_ids = "${application_subnets}"

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }
  eks_managed_node_group_defaults = {
    disk_size      = 30
    instance_types = "${instance_type}"
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = "${instance_type}"
      capacity_type  = "SPOT"
    }
  }

  manage_aws_auth_configmap = true

    tags = {
    Environment = "${environment}"
    Terraform   = "true"
    Owner       = "${team}"
  }
}