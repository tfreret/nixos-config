# Tmux configuration
{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    historyLimit = 10000;
    
    # Tmux plugins
    plugins = with pkgs.tmuxPlugins; [
      sensible  # Sensible defaults
      yank      # Better copy/paste
      resurrect # Session persistence
      continuum # Auto-save sessions
    ];
    
    # Additional tmux configuration
    extraConfig = ''
      # Enable mouse support
      set -g mouse on
      
      # Start window numbering at 1
      set -g base-index 1
      
      # Faster command sequences
      set -sg escape-time 0
      
      # Activity monitoring
      setw -g monitor-activity on
      set -g visual-activity on
      
      # Better split window commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      
      # Reload tmux config
      bind r source-file ~/.tmux.conf \; display "Reloaded!"
      
      # Smart pane switching with vim-tmux-navigator
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R
    '';
  };
}
