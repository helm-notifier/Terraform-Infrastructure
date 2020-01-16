provider "mysql" {
  endpoint = "${data.digitalocean_database_cluster.mysql.host}:${data.digitalocean_database_cluster.mysql.port}"
  username = data.digitalocean_database_cluster.mysql.user
  password = data.digitalocean_database_cluster.mysql.password
}