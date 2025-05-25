variable "hcloud_token" {
  type        = string
  description = "Hetzner Cloud API token"
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "Path to your SSH public key"
}

variable "location" {
  type    = string
  default = "fsn1"
}
