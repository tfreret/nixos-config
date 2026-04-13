{ config, pkgs, ... }:

{
  imports = [
    ../../modules/system/base.nix
    ../../modules/system/profile-devvm.nix
    ../../modules/system/applications/cli.nix
    ../../modules/system/applications/tui.nix
    ../../modules/system/services/docker.nix
    (if builtins.pathExists ./local-config.nix then ./local-config.nix else {})
  ];

  networking.hostName = "wsl-nixos";

  home-manager.users.tfreret = import ../../users/tfreret/personal.nix;

  system.stateVersion = "25.11";
}
