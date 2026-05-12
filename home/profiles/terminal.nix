# Terminal Home Manager profile
{ pkgs, ... }:

{
  imports = [
    ./base.nix
    ../modules/vscode-server.nix
    ../modules/cloud.nix
    ../modules/go.nix
    ../modules/python.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };
}
