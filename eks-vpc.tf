module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-vpc"
  cidr = var.cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_hostnames = true
  single_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "prod"
  }
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
     "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
   private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
     "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  } 
}