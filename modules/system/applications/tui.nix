# Terminal User Interface applications - Development workflow tools
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # === SESSION MANAGEMENT ===
    tmux                   # Terminal multiplexer - persistent sessions
    
    # === EDITORS ===
    vim                    # System text editor (emergency/minimal editing)
    
    # === DEVELOPMENT WORKFLOW ===
    lazygit                # Git TUI - intuitive staging, commits, branching
    lazydocker            # Docker TUI - container/image management
    
    # === AI & PRODUCTIVITY ===
    opencode              # AI-powered coding assistant
  ];
}