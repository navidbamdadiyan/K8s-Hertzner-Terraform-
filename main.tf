provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "default" {
  name       = "k8s-key"
  public_key = file(var.ssh_public_key)
}

resource "hcloud_server" "k8s_nodes" {
  count       = 3
  name        = "k8s-node-${count.index + 1}"
  image       = "ubuntu-22.04"
  server_type = "cx31"
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
}

output "node_ips" {
  value = [for s in hcloud_server.k8s_nodes : s.ipv4_address]
}
