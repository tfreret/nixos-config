{ config, pkgs, ... }:

{
  imports = [
    ../../modules/nixos/base.nix
    ../../modules/nixos/profile-devvm.nix
    ../../modules/nixos/applications/cli.nix
    ../../modules/nixos/applications/tui.nix
    ../../modules/nixos/services/docker.nix
    (if builtins.pathExists ./local-config.nix then ./local-config.nix else {})
  ];

  networking.hostName = "wsl-nixos";

  home-manager.users.tfreret = import ../../users/tfreret/personal.nix;

  system.stateVersion = "25.11";
}
