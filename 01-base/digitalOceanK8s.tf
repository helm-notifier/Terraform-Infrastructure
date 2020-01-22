resource "digitalocean_kubernetes_cluster" "helm-notifier" {
  name    = "helm-notifier-k8s"
  region  = "fra1"
  version = "1.16.2-do.2"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb"
    node_count = 5
  }
}

