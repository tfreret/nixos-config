# User account configuration
{ pkgs, ... }:

{
  # User account
  users.users.tfreret = {
    isNormalUser = true;
    description = "tfreret";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
  
  # Enable zsh
  programs.zsh.enable = true;
}
