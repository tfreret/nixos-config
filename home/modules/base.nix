# Core CLI toolset (cross-platform)
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Basics
    git
    tmux
    vim
    fzf
    openssl

    # Compression utils
    unzip
    zip
    gzip
    rsync
    gnutar

    # Data manipulation utils
    jq
    yq

    # Process/Files utils
    lsof
    htop
    btop

    # Network utils
    curl
    wget
    dig
    mtr
  ];
}
