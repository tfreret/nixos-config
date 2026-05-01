# VSCode desktop-specific configuration
{ pkgs, ... }:

{
  programs.vscode = {
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      # LaTeX
      james-yu.latex-workshop
      
      # Development
      ms-vscode.cpptools
      golang.go
      ms-python.python
      ms-python.vscode-pylance
      ms-vscode-remote.remote-ssh
      
      # Git
      github.copilot
      github.vscode-github-actions
      
      # General utilities
      vscodevim.vim
      
      # Themes
      github.github-vscode-theme
    ];
    
    # Desktop-specific user settings
    userSettings = {
      # Window settings
      "window.menuBarVisibility" = "toggle";
      "window.zoomLevel" = 0;
      
      # Explorer settings
      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;
      
      # Display settings for desktop
      "workbench.startupEditor" = "none";
      "breadcrumbs.enabled" = true;
    };
  };
}