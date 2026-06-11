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

      nix-update = "cd ~/.config/nixos-config && nix flake update";
      nix-garbage = "sudo nix-collect-garbage -d && nix-collect-garbage -d";

      nixos-rebuild-wsl     = "sudo nixos-rebuild switch --flake path:~/.config/nixos-config#dev-wsl";
      nixos-rebuild-desktop = "sudo nixos-rebuild switch --flake ~/.config/nixos-config#workstation";
      nixos-rebuild-vm      = "sudo nixos-rebuild switch --flake ~/.config/nixos-config#dev-vm";
      nixos-rebuild-macbook = "home-manager switch --flake ~/.config/nixos-config#macbook";
    };
  };

  programs.direnv = {
    enable                = true;
    enableZshIntegration  = true;
    nix-direnv.enable     = true;
  };
}
