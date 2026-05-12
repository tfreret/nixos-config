# Kubernetes development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # k8s
    kubectl
    kubernetes-helm
  ];
}