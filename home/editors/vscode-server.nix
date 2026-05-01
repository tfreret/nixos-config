# VSCode server-specific configuration
{ pkgs, ... }:

{
  # VSCode Server-specific settings
  home.file.".vscode-server/data/Machine/settings.json".text = builtins.toJSON {
    # Editor settings optimized for remote work
    "editor.fontFamily" = "'JetBrains Mono', 'Hack Nerd Font', 'Fira Code', monospace";
    "editor.formatOnSave" = true;
    
    # Terminal settings
    "terminal.integrated.fontFamily" = "'JetBrains Mono', 'Hack Nerd Font', 'Fira Code', monospace";
    "terminal.integrated.defaultProfile.linux" = "zsh";
    
    # Remote settings
    "remote.SSH.defaultExtensions" = [
      "golang.go"
      "ms-python.python"
      "vscodevim.vim"
    ];
    
    # Git settings
    "git.autofetch" = true;
    "git.enableSmartCommit" = true;
    
    # Editor tweaks for faster remote editing
    "workbench.editor.enablePreview" = false;
    "workbench.list.smoothScrolling" = false;
    "editor.cursorSmoothCaretAnimation" = "off";
    "editor.smoothScrolling" = false;
    
    # Performance optimizations
    "files.watcherExclude" = {
      "**/.git/objects/**" = true;
      "**/.git/subtree-cache/**" = true;
      "**/node_modules/**" = true;
      "**/.hg/store/**" = true;
    };
  };
  
  # Ensure we have necessary tools for VSCode Server
  home.packages = with pkgs; [
    gopls
  ];
}