{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "us";

  services.flatpak.enable = true;

  services.pipewire = {
    enable      = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;

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

  environment.systemPackages = with pkgs; [
    gnomeExtensions.tailscale-qs
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.paperwm
    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
    gnome-tweaks
    dconf-editor
    gruvbox-gtk-theme
    gruvbox-dark-icons-gtk
    gruvbox-plus-icons
    papirus-icon-theme
    adwaita-icon-theme
    bibata-cursors
    capitaine-cursors
  ];

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
