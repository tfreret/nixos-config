# Programs configuration
{ ... }:

{
  imports = [
    ./git.nix
    ./ssh.nix
    ./go.nix
    ./python.nix
    ./latex.nix
  ];
}