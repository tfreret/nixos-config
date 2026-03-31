# Go development environment
{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.home.homeDirectory}/go";
      GOBIN  = "${config.home.homeDirectory}/go/bin";
    };
  };

  home.packages = with pkgs; [
    gopls       # language server
    go-tools    # staticcheck, goimports, etc.
    delve       # debugger
    golangci-lint
  ];
}
  