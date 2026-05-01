# Core system configuration
{ pkgs, ... }:

{
  imports = [
    ./users.nix
    # Add other core modules as they're migrated
  ];
  
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
  
  # Locale and time
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Basic system packages
  environment.systemPackages = with pkgs; [
    git
    tmux
    vim
    fzf
    openssl

    unzip
    zip
    gzip
    rsync
    gnutar
    
    jq
    yq
    
    lsof
    procps
    htop
    btop

    curl
    wget
    dig
    # telnet
    mtr
  ];
  
  # Security settings
  security.sudo.wheelNeedsPassword = false;
}