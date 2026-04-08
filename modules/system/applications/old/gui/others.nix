# Productivity and development tools
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lmstudio
  ];
}
