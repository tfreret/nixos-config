# NixOS base — applied to every host
{ config, pkgs, ... }:

{
  imports = [
    ../applications
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store   = true;
  };

  nix.gc = {
    automatic = true;
    dates     = "weekly";
    options   = "--delete-older-than 7d";
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone      = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";

  security.sudo.wheelNeedsPassword = false;
}
