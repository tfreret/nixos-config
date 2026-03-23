# Default Home Manager profile — reads all values from local.nix (gitignored)
{ pkgs, lib, local, ... }:

{
  imports = [
    ../../modules/dev/git.nix
    ../../modules/core/shell.nix
  ];

  home.stateVersion = "25.11";
}
