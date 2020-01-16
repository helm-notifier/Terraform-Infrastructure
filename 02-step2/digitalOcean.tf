variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

data "digitalocean_database_cluster" "db" {
  name = "helm-notifier-pg"
}

data "digitalocean_kubernetes_cluster" "k8s" {
  name = "helm-notifier-k8s"
}
data "digitalocean_database_cluster" "mysql" {
  name = "zero-one-mysql"
}