# WSL profile for tfreret
{ pkgs, ... }:

{
  imports = [
    # Editors
    ../editors/neovim.nix
    ../editors/vscode-server.nix
    
    # Programs
    ../programs/git.nix
    ../programs/go.nix
    ../programs/python.nix
    ../programs/ssh.nix
    
    # Terminal
    ../terminal/shell.nix
    ../terminal/tmux.nix
  ];
  
  # WSL-specific configurations
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };
  
  # State version
  home.stateVersion = "25.11";
}