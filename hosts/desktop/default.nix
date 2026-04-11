{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/base.nix
    ../../modules/nixos/profile-workstation.nix
    ../../modules/nixos/applications/cli.nix
    ../../modules/nixos/applications/tui.nix
    ../../modules/nixos/applications/gui.nix
    ../../modules/nixos/applications/gaming.nix
    ../../modules/nixos/services/tailscale.nix
  ];

  myApps.gaming.enable = true;

  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };

  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  hardware.amdgpu.overdrive.enable = true;

  powerManagement.cpuFreqGovernor = "performance";
  programs.corectrl.enable = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
    pciutils
    usbutils
  ];

  home-manager.users.tfreret = import ../../users/tfreret/personal.nix;

  system.stateVersion = "25.11";
}
