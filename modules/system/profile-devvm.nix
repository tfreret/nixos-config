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

  programs.nix-ld.enable = true; # useful for vscode server
}
