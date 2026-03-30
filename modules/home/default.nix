# Home Manager default profile
{ ... }:

{
  imports = [
    ./git.nix
    ./shell.nix
    ./ssh.nix
    ./go.nix
    ./python.nix
    ./node.nix
  ];
}
