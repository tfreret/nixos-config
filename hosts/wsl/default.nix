{ config, pkgs, ... }:

{
  imports = [
    # Import core system configurations directly
    /home/tfreret/.config/nixos-config/system/core/default.nix
    /home/tfreret/.config/nixos-config/system/programs/development.nix
    (if builtins.pathExists ./local-config.nix then ./local-config.nix else {})
  ];

  # WSL-specific settings
  wsl = {
    enable = true;
    defaultUser = "tfreret";
    startMenuLaunchers = false;
    # Note: nativeSystemd is no longer needed as it's now always enabled by default
    
    # Improved WSL integration
    wslConf = {
      automount.root = "/mnt";
      interop.appendWindowsPath = true;
      network.generateHosts = true;
    };
  };

  # Hostname
  networking.hostName = "devwsl";

  # WSL-specific optimizations
  boot.isContainer = true;

  # Home Manager configuration
  home-manager.users.tfreret = import /home/tfreret/.config/nixos-config/home/profiles/tfreret-wsl.nix;
  
  # For better compatibility with vscode-server
  programs.nix-ld.enable = true;

  system.stateVersion = "25.11";
}