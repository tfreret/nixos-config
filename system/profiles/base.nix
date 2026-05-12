# Base NixOS system profile
{ ... }:

{
  imports = [
    ../modules/network.nix
    ../modules/services/podman.nix
    ../modules/users.nix
  ];

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;

  # Nix garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Optimize storage
  nix.optimise.automatic = true;

  # Nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Security settings
  # security.sudo.wheelNeedsPassword = false;
}
