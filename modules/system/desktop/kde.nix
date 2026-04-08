# KDE Plasma 6 desktop environment
{ pkgs, ... }:

{
  imports = [
    ../fonts.nix
  ];

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb.layout = "us";

  environment.systemPackages = with pkgs.kdePackages; [
    kate
    ark
    # add other KDE-specific packages if needed
  ];
}
