resource "digitalocean_kubernetes_cluster" "helm-notifier" {
  name    = "helm-notifier"
  region  = "fra1"
  version = "1.14.1-do.4"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}