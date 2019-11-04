resource "kubernetes_namespace" "helmNotifier" {
  metadata {
    name = "helm-notifier"
  }
}