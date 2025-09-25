module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = "1.30"
  enable_irsa        = true

  addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
    }
    # aws-ebs-csi-driver = {
    #   most_recent = true
    # }
  }

  endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true

  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets

  eks_managed_node_groups = {
    innovatemart_nodegroup = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 4
      desired_size = 3

      iam_role_additional_policies = {
        ebs_csi = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      }
    }
  }

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    name        = var.cluster_name
    Environment = "prod"
    Terraform   = "true"
  }
}
