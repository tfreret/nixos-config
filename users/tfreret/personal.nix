# Baseline Home Manager profile
{ pkgs, lib, ... }:

{
  imports = [
    ../../modules/home/default.nix
  ];

  home.stateVersion = "25.11";
}
