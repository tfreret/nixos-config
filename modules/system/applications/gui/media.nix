# Media and communication
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    obs-studio
    vlc
    gimp
    blender
    freecad
  ];
}
