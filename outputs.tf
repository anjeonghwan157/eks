output "vpc_id" {
  value = module.networking.vpc_id
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "alb_irsa_role_arn" {
  value = module.alb.alb_irsa_role_arn
}