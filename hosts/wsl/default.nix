# WSL host
{ config, pkgs, profile, ... }:

{
  imports = [
    ../../modules/system/common.nix
    ../../modules/system/users.nix
    ../../modules/system/wsl.nix
  ];

  networking.hostName = "nixos";

  home-manager.users.tfreret = import ../../home/profiles/${profile}.nix;

  system.stateVersion = "25.11";
}
