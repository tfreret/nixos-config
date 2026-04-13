{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
    vim
    lazygit
    lazydocker
    opencode
  ];
}
