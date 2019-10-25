terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "phumberdroz"

    workspaces {
      prefix = "helm-notifier-02-"
    }
  }
}