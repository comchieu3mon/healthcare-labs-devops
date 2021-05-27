terraform {
  required_version = ">= 0.13.3"
}

# ----------------------------------------------------------------------------------------------------------------------
# ArgoCD Resources
# ----------------------------------------------------------------------------------------------------------------------
resource "helm_release" "deploy-argo-cd" {
  name = "argo-cd"

  repository = "https://argoproj.github.io/argo-helm/"
  chart      = "argo-cd"
  version    = var.argo_cd_version

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "installCRDs"
    value = false
  }

  set {
    name  = "namespace"
    value = var.argo_namespace
  }
}


# ----------------------------------------------------------------------------------------------------------------------
# ArgoWorkflow Resources
# ----------------------------------------------------------------------------------------------------------------------
resource "helm_release" "deploy-argo-workflows" {
  name = "argo-workflow"

  repository = "https://argoproj.github.io/argo-helm/"
  chart      = "argo-workflows"
  version    = var.argo_workflow_version

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "installCRDs"
    value = false
  }

  set {
    name  = "namespace"
    value = var.argo_namespace
  }
}


# ----------------------------------------------------------------------------------------------------------------------
# Argo Event Resources
# ----------------------------------------------------------------------------------------------------------------------
resource "helm_release" "deploy-argo-events" {
  name = "argo-events"

  repository = "https://argoproj.github.io/argo-helm/"
  chart      = "argo-events"
  version    = var.argo_events_version

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "installCRDs"
    value = false
  }

  set {
    name  = "namespace"
    value = var.argo_namespace
  }
}
