# Python development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
    pyright     # language server
    ruff        # linter + formatter
  ];
}
