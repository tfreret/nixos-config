# Shared GUI stack for graphical hosts
{ ... }:

{
  imports = [
    ./gnome.nix
    ./browsers.nix
    ./tools.nix
    ./media.nix
  ];
}
