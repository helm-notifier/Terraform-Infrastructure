resource "digitalocean_database_cluster" "postgres" {
  name       = "helm-notifier-pg"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}