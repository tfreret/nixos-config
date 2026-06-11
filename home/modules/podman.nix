# Podman CLI tools (cross-platform)
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dive
    podman
    podman-compose
    podman-tui
  ];
}
