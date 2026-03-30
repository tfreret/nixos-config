# GNOME desktop environment
{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb.layout = "us";

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.tailscale-qs
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];
}
