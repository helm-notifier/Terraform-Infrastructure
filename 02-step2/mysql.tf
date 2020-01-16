provider "mysql" {
  endpoint = data.digitalocean_database_cluster.mysql.host
  username = data.digitalocean_database_cluster.mysql.user
  password = data.digitalocean_database_cluster.mysql.password
}