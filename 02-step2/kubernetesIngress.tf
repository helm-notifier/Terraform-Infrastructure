resource "kubernetes_namespace" "ingress" {
  metadata {
    name = "nginx-ingress"
  }
}