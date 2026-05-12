{ ... }:

  # TODO

{
  imports = [
    ../../system/profiles/terminal.nix
  ];

  networking.hostName = "dev-vm";

  home-manager.users.tfreret = import ../../home/profiles/terminal.nix;

  system.stateVersion = "25.11";
}
