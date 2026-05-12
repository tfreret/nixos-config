# NixOS desktop profile
{ ... }:

{
  imports = [
    ./base.nix
    ../modules/desktop.nix
    ../modules/gaming.nix
  ];
}
