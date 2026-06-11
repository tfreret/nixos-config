# Network configuration
{ lib, ... }:

{
  imports = [
    ./services/tailscale.nix
  ];

  networking = {
    networkmanager.enable = lib.mkDefault true;
    useDHCP = lib.mkDefault false;
  };
}
