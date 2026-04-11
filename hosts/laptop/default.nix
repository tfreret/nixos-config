{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/base.nix
    ../../modules/nixos/profile-workstation.nix
    ../../modules/nixos/applications/cli.nix
    ../../modules/nixos/applications/tui.nix
    ../../modules/nixos/applications/gui.nix
    ../../modules/nixos/services/tailscale.nix
  ];

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  environment.systemPackages = with pkgs; [
    pciutils
    usbutils
  ];

  home-manager.users.tfreret = import ../../users/tfreret/personal.nix;

  system.stateVersion = "25.11";
}
