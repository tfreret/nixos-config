# Shared GUI applications for graphical hosts
{ ... }:

{
  imports = [
    ./browsers.nix
    ./tools.nix
    ./media.nix
  ];
}
