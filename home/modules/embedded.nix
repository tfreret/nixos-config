# Embedded development tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    platformio
    openocd
  ];
}
