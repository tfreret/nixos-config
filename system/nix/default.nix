# Nix-specific configuration
{ pkgs, ... }:

{
  # Allow unfree packages
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
}