# Go development environment
{ pkgs, ... }:

{
  programs.go = {
    enable = true;
    goPath = "go";
    goBin  = "go/bin";
  };

  home.packages = with pkgs; [
    gopls       # language server
    go-tools    # staticcheck, goimports, etc.
    delve       # debugger
    golangci-lint
  ];
}
