{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    nodePackages.npm
    nodePackages.typescript
    nodePackages.typescript-language-server  # language server
    nodePackages.prettier
  ];
}
