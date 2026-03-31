# Go development environment
{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.home.homeDirectory}/go";
      GOBIN = "${config.home.homeDirectory}/go/bin";
      GOPROXY = "https://proxy.golang.org,direct";
      GOTOOLCHAIN = "auto";
    };
  };

  home.packages = with pkgs; [
    gopls
    go-tools
    delve
    gcc
  ];
}
