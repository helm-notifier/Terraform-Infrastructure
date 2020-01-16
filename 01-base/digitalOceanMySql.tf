resource "digitalocean_database_cluster" "mysql" {
  name       = "01-mysql"
  engine     = "mysql"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}
