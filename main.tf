module "networking" {
  source                = "./modules/networking"
  vpc_cidr              = "10.0.0.0/16"
  azs                   = ["ap-northeast-2a", "ap-northeast-2c"]
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.11.0/24", "10.0.12.0/24"]
}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = "eks"
  node_group_name    = "eks-node"
  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids
}

module "alb" {
  source                   = "./modules/alb"
  cluster_name             = module.eks.cluster_name
  cluster_endpoint         = module.eks.cluster_endpoint
  cluster_ca_certificate   = module.eks.cluster_ca_certificate
  cluster_token            = var.cluster_token
  vpc_id                   = module.networking.vpc_id
  oidc_provider_arn        = module.eks.oidc_provider_arn
  oidc_provider_url        = module.eks.oidc_provider_url
}

