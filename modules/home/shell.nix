# Bash shell configuration
{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll  = "ls -lah";
      la  = "ls -A";

      ".." = "cd ..";
      "..." = "cd ../..";

      gs  = "git status -sb";
      gd  = "git diff";
      gp  = "git push";
      gl  = "git pull";
    };

    initExtra = ''
      # Coloured prompt: user@host:dir $
      PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ '
    '';
  };

  # direnv: auto-load .envrc / nix shells
  programs.direnv = {
    enable                = true;
    enableBashIntegration = true;
    nix-direnv.enable     = true;
  };
}
