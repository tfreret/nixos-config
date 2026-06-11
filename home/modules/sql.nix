# SQL tooling
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # mysql
    postgresql
  ];
}
