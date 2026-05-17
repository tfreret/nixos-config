# Kubernetes development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # k8s
    kubectl
    kubernetes-helm
    kustomize

    # Infra
    terraform

    # Cloud Providers
    awscli
    azure-cli
    google-cloud-sdk
  ];
}
