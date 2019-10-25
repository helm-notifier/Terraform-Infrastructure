provider "postgresql" {
  host            = "${data.digitalocean_database_cluster.db.host}"
  port            = "${data.digitalocean_database_cluster.db.port}"
  database        = "${data.digitalocean_database_cluster.db.database}"
  username        = "${data.digitalocean_database_cluster.db.user}"
  password        = "${data.digitalocean_database_cluster.db.password}"
  sslmode         = "require"
  connect_timeout = 15
  superuser       = false
}