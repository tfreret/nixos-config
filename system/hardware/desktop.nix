# Desktop environment configuration
{ pkgs, ... }:

{
  # All GUI environment settings in one place
  
  # GNOME desktop
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "us";
  
  # Flatpak support
  services.flatpak.enable = true;
  
  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;
  
  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ubuntu-classic
      source-sans-pro
      jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.sauce-code-pro
      nerd-fonts.hack
      nerd-fonts.inconsolata
      noto-fonts
      noto-fonts-color-emoji
      font-awesome
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Source Serif Pro" "Ubuntu" ];
        sansSerif = [ "Source Sans Pro" "Ubuntu" ];
        monospace = [ "JetBrains Mono" "Hack Nerd Font" "Fira Code" "Ubuntu Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel.rgba = "rgb";
    };
  };
  
  # Basic GUI applications and GNOME extensions
  environment.systemPackages = with pkgs; [
    # GNOME tools
    gnome-tweaks
    dconf-editor
    # GNOME extensions
    gnomeExtensions.tailscale-qs
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.paperwm
    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
    # GNOME Themes
    gruvbox-gtk-theme
    gruvbox-dark-icons-gtk
    gruvbox-plus-icons
    papirus-icon-theme
    adwaita-icon-theme
    bibata-cursors
    capitaine-cursors
    
    # GUI applications
    firefox
    chromium
    vscode
    ghostty
    obsidian
    thunderbird
    nextcloud-client
    discord
    vlc
    obs-studio
    gimp
    blender
  ];
  
  # Remove unwanted GNOME packages
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-music
    gnome-maps
    cheese
    simple-scan
    totem
    evince
  ];

  # Tailscale is now configured in network/tailscale.nix
}