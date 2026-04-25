# Editors configuration
{ ... }:

{
  imports = [
    ./neovim.nix
    ./vscode-desktop.nix
    ./vscode-server.nix
  ];
}