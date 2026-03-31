# Desktop host — all-in-one personal configuration
# Run `nixos-generate-config` to regenerate hardware-configuration.nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/base.nix
    ../../modules/system/users.nix
    ../../modules/system/window-management/gnome.nix
    ../../modules/system/applications/gui
    ../../modules/system/applications/gui/games.nix
    ../../modules/system/services/tailscale.nix
  ];

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
