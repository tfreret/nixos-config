# Desktop host — all-in-one personal configuration
# Run `nixos-generate-config` to regenerate hardware-configuration.nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/core/base.nix
    ../../modules/system/core/users.nix
    
    # === APPLICATIONS ===
    ../../modules/system/applications/cli.nix
    ../../modules/system/applications/tui.nix  
    ../../modules/system/applications/gui.nix
    ../../modules/system/applications/gaming.nix
    
    # === SERVICES ===
    ../../modules/system/services/tailscale.nix
    
    # === DESKTOP & THEMES ===
    ../../modules/system/desktop/gnome.nix
    ../../modules/system/desktop/themes.nix
  ];

  # Enable gaming optimizations and applications
  myApps.gaming.enable = true;

  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };

  # Bootloader
  boot.loader = {
    systemd-boot.enable      = true;
    efi.canTouchEfiVariables = true;
  };

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable            = true;
    alsa.enable       = true;
    alsa.support32Bit = true;
    pulse.enable      = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Desktop-specific optimisations
  powerManagement.cpuFreqGovernor = "performance";
  programs.corectrl.enable        = true;
  hardware.amdgpu.overdrive.enable = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
    pciutils
    usbutils
  ];

  home-manager.users.tfreret = import ../../users/tfreret/personal.nix;

  system.stateVersion = "25.11";
}
