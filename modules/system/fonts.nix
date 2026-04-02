{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ubuntu-classic
      jetbrains-mono
      roboto
      roboto-mono
      geist-font
      dejavu_fonts
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Ubuntu Mono" ];
        sansSerif = [ "Ubuntu Mono" ];
        monospace = [ "Ubuntu Mono" ];
      };
    };
  };
}