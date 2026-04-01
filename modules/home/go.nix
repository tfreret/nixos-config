# Go development environment
{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.home.homeDirectory}/.development/go";
      GOBIN = "${config.home.homeDirectory}/.development/go/bin";
      GOPROXY = "https://proxy.golang.org,direct";
      GOTOOLCHAIN = "auto";
    };
  };

  home.packages = with pkgs; [
    gopls
    go-tools
    delve
    gotest
    goplay
    impl
    gcc
  ];
}
