resource "kubernetes_namespace" "openfaas" {
  metadata {
    labels = {
      role            = "openfaas-system"
      access          = "openfaas-system"
      istio-injection = "enabled"
    }

    name = "openfaas"
  }
}

resource "kubernetes_namespace" "openfaas-fn" {
  metadata {
    labels = {
      role            = "openfaas-fn"
      istio-injection = "enabled"
    }

    name = "openfaas-fn"
  }
}


resource "random_string" "openfaas-pass" {
  length  = 32
  special = false
}

resource "kubernetes_secret" "openfaas" {
  type = "generic"

  metadata {
    name      = "basic-auth"
    namespace = "${kubernetes_namespace.openfaas.metadata.0.name}"
  }

  data = {
    basic-auth-user     = "admin"
    basic-auth-password = "${random_string.openfaas-pass.result}"
  }
}
