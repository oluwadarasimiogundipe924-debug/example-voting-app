variable "aws_region" {
  description = "AWS region for the Kubernetes cluster"
  type        = string
  default     = "eu-west-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "voting-app-cluster"
}

variable "kubernetes_version" {
  description = "Supported EKS Kubernetes version"
  type        = string
  default     = "1.36"
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.small"
}
