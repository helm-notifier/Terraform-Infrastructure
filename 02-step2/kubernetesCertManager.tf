resource "kubernetes_namespace" "certManager" {
  metadata {
    name = "cert-manager"
  }
}

resource "kubernetes_secret" "cert-manager" {
  type = "Opaque"
  metadata {
    name = "cert-manager"
    namespace = kubernetes_namespace.certManager.metadata.0.name
  }
  data = {
    access-token = var.do_token
  }
}