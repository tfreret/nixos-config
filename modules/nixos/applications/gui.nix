{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    chromium
    inputs.zen-browser.packages."${pkgs.system}".default
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
    freecad
    lmstudio
  ];
}
