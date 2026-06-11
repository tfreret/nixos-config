# LaTeX environment
{ pkgs, lib, ... }:

{
  home.packages = lib.optionals pkgs.stdenv.isLinux (with pkgs; [
    texlive.combined.scheme-full
    texlivePackages.latexmk
    texlab
  ]);
}
