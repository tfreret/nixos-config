# Neovim configuration
{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    withPython3 = false;
    withRuby = false;
    # plugins = [];
  };

  # Deploy LazyVim starter config to nvim
  # TODO: Create my own config + theme
  xdg.configFile."nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "LazyVim";
      repo = "starter";
      rev = "803bc181d7c0d6d5eeba9274d9be49b287294d99";
      sha256 = "sha256-QrpnlDD4r1X4C8PqBhQ+S3ar5C+qDrU1Jm/lPqyMIFM=";
    };
    recursive = true;
  };
}
