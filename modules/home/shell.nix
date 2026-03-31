# Zsh shell configuration
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme  = "fishy";
    };

    shellAliases = {
      ll  = "ls -lah";
      la  = "ls -A";

      ".." = "cd ..";
      "..." = "cd ../..";

      gs  = "git status -sb";
      gd  = "git diff";
      gp  = "git push";
      gl  = "git pull";

      nixos-rebuild-wsl     = "sudo nixos-rebuild switch --flake path:/home/tfreret/.config/nixos-config#wsl";
      nixos-rebuild-desktop = "sudo nixos-rebuild switch --flake /home/tfreret/.config/nixos-config#desktop";
      nixos-rebuild-laptop  = "sudo nixos-rebuild switch --flake /home/tfreret/.config/nixos-config#laptop";

      nixos-update = "cd /home/tfreret/.config/nixos-config && nix flake update && nixos-rebuild";
    };

    initContent = ''
      # Rebuild current host — uses path: flake if a local-config.nix exists (includes gitignored files)
      nixos-rebuild() {
        local host=$(hostname)
        local config_dir="/home/tfreret/.config/nixos-config"
        # Map hostname to flake target
        case "$host" in
          wsl-nixos) host="wsl" ;;
        esac
        local flake_ref
        if [[ -f "$config_dir/hosts/$host/local-config.nix" ]]; then
          flake_ref="path:$config_dir#$host"
        else
          flake_ref="$config_dir#$host"
        fi
        sudo nixos-rebuild switch --flake "$flake_ref" --impure
      }
    '';
  };

  # direnv: auto-load .envrc / nix shells
  programs.direnv = {
    enable                = true;
    enableZshIntegration  = true;
    nix-direnv.enable     = true;
  };
}
