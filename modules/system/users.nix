# System user definition
{ config, pkgs, ... }:

{
  users.users.tfreret = {
    isNormalUser = true;
    description  = "tfreret";
    extraGroups  = [ "wheel" "networkmanager" ];
    shell        = pkgs.bash;
  };
}
