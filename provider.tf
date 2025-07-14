provider "aws" {
  region = "ap-northeast-2"
}

provider "helm" {
  kubernetes = {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)
    token                  = var.cluster_token
  }
}
