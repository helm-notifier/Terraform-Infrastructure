
resource "random_string" "helm-notifier" {
  length  = 32
  special = false
}

resource "postgresql_role" "helm-notifier" {
  name     = "helm-notifier"
  login    = true
  password = "${random_string.helm-repositories.result}"
}
resource "postgresql_database" "helm-notifier" {
  name              = "helm-notifier"
  owner             = "${postgresql_role.helm-repositories.name}"
  allow_connections = true
}


resource "kubernetes_secret" "helm-notifier" {
  type = "Opaque"

  metadata {
    name      = "database-uri"
    namespace = "${kubernetes_namespace.openfaas-fn.metadata.0.name}"
  }

  data = {
    database-uri = "postgresql://${postgresql_role.helm-repositories.name}:${random_string.helm-repositories.result}@${digitalocean_database_cluster.postgres.host}:${digitalocean_database_cluster.postgres.port}/${postgresql_database.helm-repositories.name}"
  }
}