resource "digitalocean_kubernetes_cluster" "helm-notifier" {
  name    = "helm-notifier"
  region  = "fra1"
  version = "1.15.5-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 3
  }
}

