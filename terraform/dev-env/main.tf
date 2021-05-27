terraform {
  required_providers {
    k8s = {
      source  = "banzaicloud/k8s"
      version = ">= 0.9.1"
    }
  }
}

locals {
  kube_config_path = "~/.kube/config"
}

provider "kubernetes" {
  config_path = local.kube_config_path
}

provider "helm" {
  kubernetes {
    config_path = local.kube_config_path
  }
}

module "install_ambassador" {
  source = "../modules/ambassador"
}

module "install_argo" {
  source = "../modules/argo"
}

# ----------------------------------------------------------------------------------------------------------------------
# Create API Gateway & Routing internal services
# ----------------------------------------------------------------------------------------------------------------------
data "template_file" "routing-argo-deployment" {
  template = file("./manifests/routing-argo-deployment.yaml")
}

resource "k8s_manifest" "routing-argo-server" {
  timeouts {
    create = "5m"
    delete = "5m"
  }
  content   = data.template_file.routing-argo-deployment.rendered
  namespace = "argocd"
}
