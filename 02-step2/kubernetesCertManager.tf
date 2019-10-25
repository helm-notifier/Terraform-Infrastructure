resource "kubernetes_namespace" "certManager" {
  metadata {
    name = "cert-manager"
  }
}