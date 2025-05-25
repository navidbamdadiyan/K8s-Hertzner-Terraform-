provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "default" {
  name      = "my-ssh-key"
  public_key = file(var.ssh_public_key)
}

resource "hcloud_server" "k8s_master" {
  name        = "k8s-master"
  image       = "ubuntu-22.04"
  server_type = "cx31"
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
}

resource "hcloud_server" "k8s_worker" {
  count       = var.worker_count
  name        = "k8s-worker-${count.index + 1}"
  image       = "ubuntu-22.04"
  server_type = "cx21"
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
}

output "master_ip" {
  value = hcloud_server.k8s_master.ipv4_address
}

output "worker_ips" {
  value = [for server in hcloud_server.k8s_worker : server.ipv4_address]
}
