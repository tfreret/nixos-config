# Laptop host
# Run `nixos-generate-config` to generate hardware-configuration.nix
{ config, pkgs, profile, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core/common.nix
    ../../modules/core/users.nix
    ../../modules/desktop/gnome.nix
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
  };

  home-manager.users.tfreret = import ../../users/tfreret/${profile}.nix;

  system.stateVersion = "25.11";
}
