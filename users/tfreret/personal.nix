# Baseline Home Manager profile — all machines start here
# Work-specific overrides go in hosts/wsl/local-config.nix
{ pkgs, lib, ... }:

{
  imports = [
    ../../modules/home/default.nix
  ];

  home.stateVersion = "25.11";
}
