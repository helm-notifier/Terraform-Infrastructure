# provider "postgresql" {
#   host            = "${digitalocean_database_cluster.postgres.host}"
#   port            = "${digitalocean_database_cluster.postgres.port}"
#   database        = "${digitalocean_database_cluster.postgres.database}"
#   username        = "${digitalocean_database_cluster.postgres.user}"
#   password        = "${digitalocean_database_cluster.postgres.password}"
#   sslmode         = "require"
#   connect_timeout = 15
#   superuser = false
# }