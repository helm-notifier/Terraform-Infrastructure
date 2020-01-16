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
  plaintext_password = random_password.mysql-zero-one-forum.result
  user = "zero-one-fourm"
  host = "%"
}
resource "mysql_database" "zero-one-forum" {
  name              = "zero-one-forum"
}