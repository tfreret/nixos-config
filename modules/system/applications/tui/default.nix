# Terminal UI applications
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
    vim
    neovim
    lazygit
    lazydocker
  ];
}
