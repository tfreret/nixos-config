# Default Home Manager profile — reads all values from local.nix (gitignored)
{ pkgs, lib, local, ... }:

{
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/shell.nix
  ];

  home.stateVersion = "25.11";
}
