# Laptop host
# Run `nixos-generate-config` to generate hardware-configuration.nix
{ config, pkgs, profile, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common.nix
    ../../modules/system/users.nix
    ../../modules/system/gnome.nix
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

  home-manager.users.tfreret = import ../../home/profiles/${profile}.nix;

  system.stateVersion = "25.11";
}
