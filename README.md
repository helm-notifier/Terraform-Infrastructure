# Terraform-Infrastructure

Fresh deployment needs to be done in 2 steps:
- comment out everything that has to do with the postgres provider and apply
- uncomment everything that you just commented and apply again

Get k8s Config:
doctl kubernetes cluster kubeconfig save helm-notifier
