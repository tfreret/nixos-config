# Go development environment
{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.home.homeDirectory}/.config/go";
      GOBIN = "${config.home.homeDirectory}/.config/go/bin";
      GOPROXY = "https://proxy.golang.org,direct";
      GOTOOLCHAIN = "auto";
      GONOSUMDB = "sum.golang.org";
    };
  };

  home.packages = with pkgs; [
    gopls
    go-tools
    delve
    gotest
    impl
    gcc
  ];
}
