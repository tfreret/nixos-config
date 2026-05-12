# NixOS WSL profile
{ ... }:

{
  # WSL-specific optimizations
  boot.isContainer = true;

  # For better compatibility with vscode-server
  programs.nix-ld.enable = true;
}
