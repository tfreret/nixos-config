# Font and theme foundation for consistent desktop experience
# Gruvbox-focused theming with comprehensive font support
{ pkgs, ... }:

{
  # === FONT CONFIGURATION ===
  fonts = {
    enableDefaultPackages = true;
    
    packages = with pkgs; [
      # === SYSTEM FONTS ===
      ubuntu-classic              # Primary UI fonts (Ubuntu family)
      source-sans-pro            # Clean system font (alternative to Ubuntu)
      
      # === DEVELOPMENT FONTS ===  
      jetbrains-mono             # Coding font - excellent readability
      nerd-fonts.fira-code       # Terminal font with programming ligatures
      nerd-fonts.sauce-code-pro  # Alternative coding font with nerdfont symbols (sauce-code-pro is the correct name)
      
      # === GRUVBOX-OPTIMIZED FONTS ===
      # These fonts work particularly well with gruvbox theme
      nerd-fonts.hack            # Monospace font optimized for low-light coding
      nerd-fonts.inconsolata     # Excellent readability in dark themes
      
      # === ADDITIONAL FONTS ===
      noto-fonts                 # Google's font family with wide language support
      noto-fonts-color-emoji     # Emoji support (correct package name)
      font-awesome               # Icon fonts for applications
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Source Serif Pro" "Ubuntu" ];
        sansSerif = [ "Source Sans Pro" "Ubuntu" ];
        monospace = [ 
          "JetBrains Mono"       # Primary coding font - best for gruvbox
          "Hack Nerd Font"       # Excellent for dark themes  
          "Fira Code"            # Fallback with ligatures  
          "Ubuntu Mono"          # System fallback
        ];
        emoji = [ "Noto Color Emoji" ];
      };
      
      # Font rendering optimizations
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel.rgba = "rgb";
    };
  };

  # === THEMING PACKAGES ===
  environment.systemPackages = with pkgs; [
    # Gruvbox-compatible cursor themes
    bibata-cursors              # Modern cursor theme
    capitaine-cursors           # Clean, minimal cursors
    
    # Additional theming resources can be added here
    # Gruvbox wallpapers and backgrounds would go here if available in nixpkgs
  ];

  # === GRUVBOX COLOR PALETTE REFERENCE ===
  # Dark theme colors (for reference in other configurations):
  # Background:  #282828 (dark0)
  # Foreground:  #ebdbb2 (light1) 
  # Red:         #cc241d (red)
  # Green:       #98971a (green)
  # Yellow:      #d79921 (yellow)
  # Blue:        #458588 (blue)
  # Purple:      #b16286 (purple)
  # Aqua:        #689d6a (aqua)
  # Orange:      #d65d0e (orange)

  # === GRUVBOX THEME INTEGRATION NOTES ===
  # This file provides the foundation for gruvbox theming across the system:
  # 
  # For GNOME: 
  # - GTK themes handled in gnome.nix
  # - User-specific settings via home-manager
  # - dconf settings for complete theme application
  #
  # For terminal applications:
  # - Gruvbox color schemes should be configured per application
  # - Alacritty, kitty, tmux, vim all have gruvbox variants
  #
  # For development environments:
  # - VS Code gruvbox themes available via extensions
  # - Vim/Neovim gruvbox colorschemes widely supported
}