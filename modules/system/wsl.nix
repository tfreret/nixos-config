# WSL-specific system options
{ config, pkgs, ... }:

{
  wsl = {
    enable             = true;
    defaultUser        = "tfreret";
    startMenuLaunchers = false;
  };

  environment.systemPackages = with pkgs; [
    wslu
  ];

  # nix-ld allows running unpatched dynamic binaries (useful for vs-code server)
  programs.nix-ld.enable = true;
}
