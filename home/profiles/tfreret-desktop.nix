# Desktop profile for tfreret
{ pkgs, ... }:

{
  imports = [
    # Editors
    ../editors/neovim.nix
    ../editors/vscode-desktop.nix
    
    # Programs
    ../programs/git.nix
    ../programs/go.nix
    ../programs/python.nix
    ../programs/latex.nix
    ../programs/ssh.nix
    
    # Terminal
    ../terminal/shell.nix
    ../terminal/tmux.nix
  ];
  
  # Desktop-specific packages
  home.packages = with pkgs; [
    # Additional tools specific to desktop
    gnome.gnome-calendar
    
    # System utilities
    blueman  # Bluetooth manager
    
    # Development tools
    gcc  # C compiler
  ];
  
  # Desktop-specific configuration
  programs.zsh.shellAliases = {
    nixos-rebuild = "sudo nixos-rebuild switch --flake /home/tfreret/.config/nixos-config#desktop";
  };
  
  # State version
  home.stateVersion = "25.11";
}