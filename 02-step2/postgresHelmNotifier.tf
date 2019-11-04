
resource "random_string" "helm-notifier" {
  length  = 32
  special = false
}

resource "postgresql_role" "helm-notifier" {
  name     = "helm-notifier"
  login    = true
  password = "${random_string.helm-notifier.result}"
}
resource "postgresql_database" "helm-notifier" {
  name              = "helm-notifier"
  owner             = "${postgresql_role.helm-notifier.name}"
  allow_connections = true
}


resource "kubernetes_secret" "helm-notifier" {
  type = "Opaque"

  metadata {
    name      = "database-uri"
    namespace = "${kubernetes_namespace.openfaas-fn.metadata.0.name}"
  }

  data = {
    database-uri = "postgresql://${postgresql_role.helm-notifier.name}:${random_string.helm-notifier.result}@${data.digitalocean_database_cluster.db.host}:${data.digitalocean_database_cluster.db.port}/${postgresql_database.helm-notifier.name}?sslmode=require"
  }
}


resource "kubernetes_secret" "helmNotifierDb" {
  type = "Opaque"

  metadata {
    name      = "database-uri"
    namespace = "${kubernetes_namespace.helmNotifier.metadata.0.name}"
  }

  data = {
    database-uri = "postgresql://${postgresql_role.helm-notifier.name}:${random_string.helm-notifier.result}@${data.digitalocean_database_cluster.db.host}:${data.digitalocean_database_cluster.db.port}/${postgresql_database.helm-notifier.name}?sslmode=require"
  }
}