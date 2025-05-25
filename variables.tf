variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "Path to SSH public key"
  type        = string
}

variable "location" {
  default     = "fsn1"
  description = "Hetzner location"
}

variable "worker_count" {
  description = "Number of Kubernetes worker nodes"
  default     = 2
}
