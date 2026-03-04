# Shared NixOS configuration applied to every host
{ config, pkgs, ... }:

{
  # Nix settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Timezone & locale
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT    = "fr_FR.UTF-8";
    LC_MONETARY       = "fr_FR.UTF-8";
    LC_NAME           = "fr_FR.UTF-8";
    LC_NUMERIC        = "fr_FR.UTF-8";
    LC_PAPER          = "fr_FR.UTF-8";
    LC_TELEPHONE      = "fr_FR.UTF-8";
    LC_TIME           = "fr_FR.UTF-8";
  };

  # Base system packages
  environment.systemPackages = with pkgs; [
    git
    nano
    vim
    curl
    wget
    tree
    unzip
  ];

  # Default user
  users.users.tfreret = {
    isNormalUser = true;
    description  = "tfreret";
    extraGroups  = [ "wheel" "networkmanager" ];
    shell        = pkgs.bash;
  };

  # Allow tfreret to run sudo without password (handy for WSL / VMs)
  security.sudo.wheelNeedsPassword = false;
}
