# WSL host
{ config, pkgs, profile, ... }:

{
  imports = [
    ../../modules/core/common.nix
    ../../modules/core/users.nix
    ../../modules/core/wsl.nix
  ];

  networking.hostName = "dev-vm";

  home-manager.users.tfreret = import ../../users/tfreret/${profile}.nix;

  system.stateVersion = "25.11";
}
