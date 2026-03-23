# Desktop host
# Run `nixos-generate-config` to regenerate hardware-configuration.nix
{ config, pkgs, profile, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core/common.nix

    ../../modules/core/users.nix
    ../../modules/desktop/gnome.nix
    ../../modules/gaming/games.nix
    
    ../../modules/services/tailscale.nix
    ../../modules/apps/productivity.nix
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
    corectrl
    discord
    obs-studio
    vlc
    gimp
  ];

  home-manager.users.tfreret = import ../../users/tfreret/${profile}.nix;

  system.stateVersion = "25.11";
}
