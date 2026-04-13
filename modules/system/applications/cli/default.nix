# Command-line applications
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    fzf
    unzip
    gzip
    lsof
    openssl
  ];
}
