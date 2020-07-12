variable "region" {
  type    = string
  default = "us-east1"
}

variable "zone" {
  description = "zone"
  default = "us-east1"
}

variable "project_name" {
  type        = string
  description = "A project name"
}


variable "vpc_name" {
  type        = string
  description = "Development VPC"
  default     = "development"
}

variable "vpc_routing_mode" {
  type        = string
  description = "VPC Routing Mode"
  default     = "REGIONAL"
}

variable "cluster_name" {
  type        = string
  description = "Cluster Name"
  default     = "cluster-development"
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR"
  default     = "10.10.0.0/16"
}

variable "master_authorized_networks_config" {
  description = <<EOF
  The desired configuration options for master authorized networks. Omit the nested cidr_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists)
  ### example format ###
  master_authorized_networks_config = [{
    cidr_blocks = [{
      cidr_block   = "10.0.0.0/8"
      display_name = "example_network"
    }],
  }]
  EOF
  type        = list(any)
  default     = []
}

variable "k8s_username" {
  type        = string
  description = "k8s user"
}

variable "k8s_password" {
  type        = string
  description = "k8s pass"
}

variable "disable_istio" {
  type        = bool
  description = "Disable istio on create stage."
}

variable "disable_hpa" {
  type        = bool
  description = "disable horizontal pod autoscale"
}

variable "machine_preemptible" {
  type        = bool
  description = "create preemptive machines"
}

variable "machine_type" {
  type        = string
  description = "choose the machine type to your workers nodes."
}