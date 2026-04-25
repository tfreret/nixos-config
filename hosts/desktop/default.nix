{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # Import the core system configurations
    ../../system/core/default.nix
    ../../system/hardware/desktop.nix
    ../../system/programs/development.nix
    ../../system/programs/gaming.nix
  ];

  # Enable gaming features
  myApps.gaming.enable = true;
  
  # Enable llama.cpp inference server
  services.llama-cpp-server.enable = true;

  # Desktop-specific hardware settings
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.amdgpu.overdrive.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  programs.corectrl.enable = true;

  # Boot and network
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  
  networking = {
    hostName = "desktop01";
    networkmanager.enable = true;
  };

  # Additional system packages for hardware management
  environment.systemPackages = with pkgs; [
    lm_sensors
    pciutils
    usbutils
  ];

  # Home Manager configuration
  home-manager.users.tfreret = import ../../home/profiles/tfreret-desktop.nix;

  system.stateVersion = "25.11";
}