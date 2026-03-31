# Laptop host — all-in-one personal configuration
# Run `nixos-generate-config` to generate hardware-configuration.nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/base.nix
    ../../modules/system/users.nix
    ../../modules/system/window-management/gnome.nix
    ../../modules/system/applications/gui
    ../../modules/system/services/tailscale.nix
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

  environment.systemPackages = with pkgs; [
    pciutils
    usbutils
  ];

  home-manager.users.tfreret = import ../../users/tfreret/personal.nix;

  system.stateVersion = "25.11";
}
