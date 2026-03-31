# System user definition
{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.tfreret = {
    isNormalUser = true;
    description  = "tfreret";
    extraGroups  = [ "wheel" "networkmanager" ];
    shell        = pkgs.zsh;
  };
}
