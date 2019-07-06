resource "kubernetes_namespace" "certManager" {
  metadata {
    name = "monitoring"
  }
}