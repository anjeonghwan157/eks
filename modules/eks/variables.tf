variable "cluster_name" {
  description = "EKS 클러스터 이름"
  type        = string
}

variable "node_group_name" {
  description = "EKS 노드 그룹 이름"
  type        = string
}

variable "vpc_id" {
  description = "EKS가 사용할 VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "EKS가 사용할 private subnet 목록"
  type        = list(string)
}
