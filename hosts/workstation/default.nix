{ config, pkgs, ... }:

kubectl get events -n nia --sort-by=.lastTimestamp | tail -n 20

{
  imports = [
    ./hardware-configuration.nix
    ../../system/profiles/desktop.nix
  ];

  myApps.gaming.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.amdgpu.overdrive.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  programs.corectrl.enable = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "workstation";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    lm_sensors
    pciutils
    usbutils
  ];

  home-manager.users.tfreret = import ../../home/profiles/desktop.nix;

  system.stateVersion = "25.11";
}
