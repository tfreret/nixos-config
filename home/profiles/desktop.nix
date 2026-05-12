# Desktop Home Manager profile
{ pkgs, lib, ... }:

{
  imports = [
    ./base.nix
    ../modules/vscode-desktop.nix
    ../modules/go.nix
    ../modules/python.nix
    ../modules/latex.nix
  ];

  home.packages = with pkgs; [
    gcc
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    gnome-calendar
    blueman
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };
}
