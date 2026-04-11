# Python development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    uv
  ];
}
