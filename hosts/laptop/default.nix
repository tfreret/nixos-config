# Laptop host — all-in-one personal configuration
# Run `nixos-generate-config` to generate hardware-configuration.nix
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
    # Note: Gaming disabled on laptop for battery optimization
    
    # === SERVICES ===
    ../../modules/system/services/tailscale.nix
    
    # === DESKTOP & THEMES ===
    ../../modules/system/desktop/gnome.nix
    ../../modules/system/desktop/themes.nix
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
