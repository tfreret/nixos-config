{ config, pkgs, ... }:

{
  services.tailscale.enable = true;

  networking.firewall = {
    trustedInterfaces = [ "tailscale0" ];
    checkReversePath = "loose";
    allowedUDPPorts = [ config.services.tailscale.port ];
  };
}