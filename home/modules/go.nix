# Go development environment
{ config, pkgs, lib, ... }:

{
  programs.go = {
    enable = true;
    env = {
      GOPATH = "${config.home.homeDirectory}/.go";
      GOBIN = "${config.home.homeDirectory}/.go/bin";
      GOPROXY = "https://proxy.golang.org,direct";
      GONOSUMDB = "sum.golang.org";
      GOTOOLCHAIN = "auto";
    };
  };

  home.packages = with pkgs; [
    gopls
    go-tools
    delve
    gotest
    impl
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    gcc
  ];
}
