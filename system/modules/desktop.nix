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
  # add app images
  
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
      noto-fonts
      noto-fonts-color-emoji
      font-awesome
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Ubuntu" ];
        sansSerif = [ "Ubuntu" ];
        monospace = [ "Ubuntu Mono" ];
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
    gnome-tweaks
    dconf-editor

    gnomeExtensions.tailscale-qs
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals

    gruvbox-gtk-theme
    gruvbox-dark-icons-gtk
    gruvbox-plus-icons

    firefox
    chromium
    vscode
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
}
