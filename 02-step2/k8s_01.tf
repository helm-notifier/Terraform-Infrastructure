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
  auth_plugin = "mysql_native_password"
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
