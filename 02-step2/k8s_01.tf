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
  type = "Opaque"
  metadata {
    name = "keycloak"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
   data = {
     database = mysql_database.zero-one-keycloak.name
     username = mysql_user.zero-one-keycloak.user
     password = random_password.zero-one-keycloak.result
     host = data.digitalocean_database_cluster.mysql.host
     port = data.digitalocean_database_cluster.mysql.port
   }
}

resource "random_password" "zero-one-banking" {
  length  = 32
  special = false
}

resource "mysql_user" "zero-one-banking" {
  user = "zero-one-banking"
  plaintext_password = random_password.zero-one-banking.result
  host = "%"
}

resource "mysql_database" "zero-one-banking" {
  name              = "zero-one-banking"
}

resource "mysql_grant" "zero-one-banking" {
  user       = mysql_user.zero-one-banking.user
  host       = mysql_user.zero-one-banking.host
  database   = mysql_database.zero-one-banking.name
  privileges = ["ALL"]
}

resource "kubernetes_secret" "banking" {
  type = "Opaque"
  metadata {
    name = "banking"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
  data = {
    database = mysql_database.zero-one-banking.name
    username = mysql_user.zero-one-banking.user
    password = random_password.zero-one-banking.result
    host = data.digitalocean_database_cluster.mysql.host
    port = data.digitalocean_database_cluster.mysql.port
  }
}

resource "random_password" "zero-one-messaging" {
  length  = 32
  special = false
}

resource "mysql_user" "zero-one-messaging" {
  user = "zero-one-messaging"
  plaintext_password = random_password.zero-one-messaging.result
  host = "%"
}

resource "mysql_database" "zero-one-messaging" {
  name              = "zero-one-messaging"
}

resource "mysql_grant" "zero-one-messaging" {
  user       = mysql_user.zero-one-messaging.user
  host       = mysql_user.zero-one-messaging.host
  database   = mysql_database.zero-one-messaging.name
  privileges = ["ALL"]
}

resource "kubernetes_secret" "messaging" {
  type = "Opaque"
  metadata {
    name = "messaging"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
  data = {
    database = mysql_database.zero-one-messaging.name
    username = mysql_user.zero-one-messaging.user
    password = random_password.zero-one-messaging.result
    host = data.digitalocean_database_cluster.mysql.host
    port = data.digitalocean_database_cluster.mysql.port
  }
}

resource "random_password" "rabbitmq" {
  length  = 32
  special = false
}

resource "kubernetes_secret" "rabbitmq" {
  type = "Opaque"
  metadata {
    name = "rabbitmq-pass"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
  data = {
    rabbitmq-password = random_password.rabbitmq.result
  }
}

resource "random_password" "zero-one-item" {
  length  = 32
  special = false
}

resource "mysql_user" "zero-one-item" {
  user = "zero-one-item"
  plaintext_password = random_password.zero-one-item.result
  host = "%"
}

resource "mysql_database" "zero-one-item" {
  name              = "zero-one-item"
}

resource "mysql_grant" "zero-one-item" {
  user       = mysql_user.zero-one-item.user
  host       = mysql_user.zero-one-item.host
  database   = mysql_database.zero-one-item.name
  privileges = ["ALL"]
}

resource "kubernetes_secret" "item" {
  type = "Opaque"
  metadata {
    name = "item"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
  data = {
    server = "server=${data.digitalocean_database_cluster.mysql.host};port=${data.digitalocean_database_cluster.mysql.port};database=${mysql_database.zero-one-item.name};user=${mysql_user.zero-one-item.user};pwd=${random_password.zero-one-item.result}"
  }
}

resource "random_password" "zero-one-shops" {
  length  = 32
  special = false
}

resource "mysql_user" "zero-one-shops" {
  user = "zero-one-shops"
  plaintext_password = random_password.zero-one-shops.result
  host = "%"
}

resource "mysql_database" "zero-one-shops" {
  name              = "zero-one-shops"
}

resource "mysql_grant" "zero-one-shops" {
  user       = mysql_user.zero-one-shops.user
  host       = mysql_user.zero-one-shops.host
  database   = mysql_database.zero-one-shops.name
  privileges = ["ALL"]
}

resource "kubernetes_secret" "shops" {
  type = "Opaque"
  metadata {
    name = "shops"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
  data = {
    server = "server=${data.digitalocean_database_cluster.mysql.host};port=${data.digitalocean_database_cluster.mysql.port};database=${mysql_database.zero-one-shops.name};user=${mysql_user.zero-one-shops.user};pwd=${random_password.zero-one-shops.result}"
  }
}

resource "random_password" "zero-one-inventory" {
  length  = 32
  special = false
}

resource "mysql_user" "zero-one-inventory" {
  user = "zero-one-inventory"
  plaintext_password = random_password.zero-one-inventory.result
  host = "%"
}

resource "mysql_database" "zero-one-inventory" {
  name              = "zero-one-inventory"
}

resource "mysql_grant" "zero-one-inventory" {
  user       = mysql_user.zero-one-inventory.user
  host       = mysql_user.zero-one-inventory.host
  database   = mysql_database.zero-one-inventory.name
  privileges = ["ALL"]
}

resource "kubernetes_secret" "inventory" {
  type = "Opaque"
  metadata {
    name = "inventory"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
  data = {
    server = "server=${data.digitalocean_database_cluster.mysql.host};port=${data.digitalocean_database_cluster.mysql.port};database=${mysql_database.zero-one-inventory.name};user=${mysql_user.zero-one-inventory.user};pwd=${random_password.zero-one-inventory.result}"
  }
}

resource "random_password" "zero-one-character" {
  length  = 32
  special = false
}

resource "mysql_user" "zero-one-character" {
  user = "zero-one-character"
  plaintext_password = random_password.zero-one-character.result
  host = "%"
}

resource "mysql_database" "zero-one-character" {
  name              = "zero-one-character"
}

resource "mysql_grant" "zero-one-character" {
  user       = mysql_user.zero-one-character.user
  host       = mysql_user.zero-one-character.host
  database   = mysql_database.zero-one-character.name
  privileges = ["ALL"]
}

resource "kubernetes_secret" "character" {
  type = "Opaque"
  metadata {
    name = "character"
    namespace = kubernetes_namespace.zero-one.metadata.0.name
  }
  data = {
    server = "server=${data.digitalocean_database_cluster.mysql.host};port=${data.digitalocean_database_cluster.mysql.port};database=${mysql_database.zero-one-character.name};user=${mysql_user.zero-one-character.user};pwd=${random_password.zero-one-character.result}"
  }
}
