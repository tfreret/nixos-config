# Productivity and development tools
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    obsidian
    nextcloud-client
    thunderbird
    ghostty
  ];
}
