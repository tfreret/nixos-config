# Base nix-darwin modules
{ ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    brews = [
      "mole"
    ];
#     casks = [
#     ];
  };

  system.defaults = { };
}
