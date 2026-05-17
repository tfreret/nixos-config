{ pkgs, ... }:

  # TODO

{
  imports = [
    ../../darwin/profiles/base.nix
  ];

  networking.hostName = "macbook";

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
  system.primaryUser = "tfreret";

  users.users.tfreret = {
    home = "/Users/tfreret";
    shell = pkgs.zsh;
  };

  home-manager.users.tfreret = import ../../home/profiles/desktop.nix;
  home-manager.backupFileExtension = "bak";
}
