resource "kubernetes_namespace" "zero-one" {
  metadata {
    name = "01"
  }
}

resource "random_password" "mysql-zero-one-forum" {
  length  = 32
  special = false
}

resource "mysql_user" "zero-one-forum" {
  user = "zero-one-forum"
  plaintext_password = random_password.mysql-zero-one-forum.result
  host = "%"
}

resource "mysql_database" "zero-one-forum" {
  name              = "zero-one-forum"
}

resource "mysql_grant" "zero-one-forum" {
  user       = mysql_user.zero-one-forum.user
  host       = mysql_user.zero-one-forum.host
  database   = mysql_database.zero-one-forum.name
  privileges = ["ALL"]
}

resource "random_password" "zero-one-keycloak" {
  length  = 32
  special = false
}

resource "mysql_user" "zero-one-keycloak" {
  user = "zero-one-keycloak"
  plaintext_password = random_password.zero-one-keycloak.result
  host = "%"
}

resource "mysql_database" "zero-one-keycloak" {
  name              = "zero-one-keycloak"
}

resource "mysql_grant" "zero-one-keycloak" {
  user       = mysql_user.zero-one-keycloak.user
  host       = mysql_user.zero-one-keycloak.host
  database   = mysql_database.zero-one-keycloak.name
  privileges = ["ALL"]
}

resource "kubernetes_secret" "keycloak" {
  metadata {
    name = "keycloak"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
   data {
     database = mysql_database.zero-one-keycloak.name
     username = mysql_user.zero-one-keycloak.user
     password = random_password.zero-one-keycloak.result
     host = data.digitalocean_database_cluster.mysql.host
     port = data.digitalocean_database_cluster.mysql.port
   }
}
