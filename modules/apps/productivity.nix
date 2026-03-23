{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    obsidian
    nextcloud-client
  ];
}
