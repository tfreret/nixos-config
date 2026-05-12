# Base Home Manager profile (cross-platform)
{ ... }:

{
  imports = [
    ../modules/base.nix
    ../modules/git.nix
    ../modules/javascript.nix
    ../modules/ssh.nix
    ../modules/shell.nix
    ../modules/tmux.nix
    ../modules/neovim.nix
    # ../modules/opencode.nix
  ];

  home.stateVersion = "25.11";
}
