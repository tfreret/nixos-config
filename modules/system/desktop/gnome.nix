# GNOME desktop environment with gruvbox theming
{ pkgs, ... }:

{
  imports = [
    ./themes.nix  # Updated path since fonts.nix is now themes.nix
  ];

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb.layout = "us";

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    # === GNOME EXTENSIONS ===
    gnomeExtensions.tailscale-qs          # Quick Tailscale toggle
    gnomeExtensions.user-themes           # Required for custom themes
    gnomeExtensions.dash-to-dock          # Classic dock experience
    gnomeExtensions.paperwm               # Tiled window management (optional)
    gnomeExtensions.blur-my-shell         # Modern blur effects
    gnomeExtensions.vitals                # System monitoring in top bar
    
    # === THEMING TOOLS ===
    gnome-tweaks                          # Essential GNOME customization
    dconf-editor                          # Advanced settings editor
    
    # === GRUVBOX THEME COMPONENTS ===
    gruvbox-gtk-theme                     # GTK theme in gruvbox colors
    gruvbox-dark-icons-gtk               # Matching icon theme (correct name)
    gruvbox-plus-icons                   # Alternative high-quality gruvbox icons
    
    # === ADDITIONAL THEMING ===
    papirus-icon-theme                    # High-quality icon set (fallback)
    adwaita-icon-theme                    # Default GNOME icons (required)
  ];

  environment.gnome.excludePackages = with pkgs; [
    # Remove unwanted default apps
    gnome-tour
    gnome-music
    gnome-maps
    cheese              # Webcam app - remove if not needed
    simple-scan         # Scanner app - remove if not needed
    totem               # Video player - remove if using alternative
    evince              # PDF viewer - remove if using alternative  
  ];

  # === GRUVBOX THEME NOTES ===
  # User-specific theming should be handled via home-manager or manually via:
  # - GNOME Tweaks for GTK themes, icon themes, and fonts
  # - dconf-editor for advanced customizations
  # - gsettings commands for scripted theme application
  #
  # To apply gruvbox theme manually:
  # gsettings set org.gnome.desktop.interface gtk-theme 'gruvbox-dark'
  # gsettings set org.gnome.desktop.interface icon-theme 'gruvbox-dark'
}
