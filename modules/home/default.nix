# Home Manager default profile
{ ... }:

{
  imports = [
    ./git.nix
    ./shell.nix
    ./ssh.nix
    ./go.nix
    ./python.nix
    ./opencode.nix
    ./neovim.nix
  ];
}
