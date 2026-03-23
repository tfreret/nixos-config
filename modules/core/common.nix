# System-level configuration shared across every host
{ config, pkgs, inputs, ... }:

{
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
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT    = "en_US.UTF-8";
    LC_MONETARY       = "en_US.UTF-8";
    LC_NAME           = "en_US.UTF-8";
    LC_NUMERIC        = "en_US.UTF-8";
    LC_PAPER          = "en_US.UTF-8";
    LC_TELEPHONE      = "en_US.UTF-8";
    LC_TIME           = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    curl
    wget
    
    hping

    htop
    btop

    tmux
    tree
    
    unzip
    gzip

    pciutils
    usbutils

    firefox
    vscode
    inputs.zen-browser.packages."${pkgs.system}".default
  ];

  security.sudo.wheelNeedsPassword = false;
}
