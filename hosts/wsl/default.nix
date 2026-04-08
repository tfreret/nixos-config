# WSL host
# Baseline: personal configuration
# Optional: ./local-config.nix (gitignored) for work-specific overrides
{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system/core/base.nix
    ../../modules/system/core/users.nix
    ../../modules/system/wsl.nix
    
    # === APPLICATIONS ===
    ../../modules/system/applications/cli.nix
    ../../modules/system/applications/tui.nix
    # Note: GUI applications not included in WSL (headless environment)
    
    # === SERVICES ===
    ../../modules/system/services/docker.nix

    # Graceful import: load ./local-config.nix if it exists
    (if builtins.pathExists ./local-config.nix then ./local-config.nix else {})
  ];

  networking.hostName = "wsl-nixos";

  home-manager.users.tfreret = import ../../users/tfreret/personal.nix;

  system.stateVersion = "25.11";
}
