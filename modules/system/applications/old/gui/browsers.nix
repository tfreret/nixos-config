# Browsers
{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    chromium
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
