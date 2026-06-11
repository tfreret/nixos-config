# Desktop Home Manager profile
{ pkgs, lib, ... }:

{
  imports = [
    ./base.nix
    ../modules/vscode-desktop.nix
    ../modules/go.nix
    ../modules/python.nix
    ../modules/c-cpp.nix
    ../modules/rust.nix
    ../modules/embedded.nix
    ../modules/sql.nix
    ../modules/latex.nix
  ];

  home.packages = with pkgs; [
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
