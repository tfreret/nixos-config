{ ... }:

  # TODO

{
  imports = [
    ../../darwin/profiles/base.nix
  ];

  networking.hostName = "macbook";

  home-manager.users.tfreret = import ../../home/profiles/desktop.nix;
}
