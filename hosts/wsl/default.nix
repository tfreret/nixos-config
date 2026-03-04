# WSL NixOS host configuration
{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
  ];

  networking.hostName = "nixos";

  # WSL settings
  wsl = {
    enable        = true;
    defaultUser   = "tfreret";
    startMenuLaunchers = false;
  };

  # WSL does not use a bootloader or sound server
  # Add any WSL-specific packages below
  environment.systemPackages = with pkgs; [
    wslu  # WSL utilities (wslview, wslpath, etc.)
  ];

  system.stateVersion = "25.11";
}
