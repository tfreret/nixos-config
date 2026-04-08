# Consolidated applications - Use individual files for better organization
# 
# Import patterns:
# - CLI tools only: import ./cli.nix
# - TUI tools only: import ./tui.nix  
# - GUI apps only: import ./gui.nix
# - Gaming setup: import ./gaming.nix (with myApps.gaming.enable = true)
#
# Or import this file for basic CLI + TUI tools
{ ... }:

{
  imports = [
    ./cli.nix
    ./tui.nix
  ];
}
