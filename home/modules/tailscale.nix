# Tailscale CLI tools (cross-platform)
{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    tailscale
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    tailscale-systray
  ];
}
