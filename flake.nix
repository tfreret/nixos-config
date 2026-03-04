{
  description = "Personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }:
  let
    system = "x86_64-linux";

    # local.nix is gitignored — contains private values (emails, key paths, gpg ids)
    # Copy local.nix.example to local.nix and fill in your values.
    local = if builtins.pathExists ./local.nix then import ./local.nix else {};

    mkHost = { host, profile ? "personal", extraModules ? [] }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit profile local; };
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs     = true;
            home-manager.useUserPackages   = true;
            home-manager.extraSpecialArgs  = { inherit local; };
          }
          ./hosts/${host}/default.nix
        ] ++ extraModules;
      };

  in {
    nixosConfigurations = {

      # WSL — profil perso
      wsl = mkHost {
        host = "wsl";
        extraModules = [ nixos-wsl.nixosModules.default ];
      };

      # Desktop — profil perso
      desktop = mkHost { host = "desktop"; };

      # Laptop — profil perso
      laptop = mkHost { host = "laptop"; };

      # Desktop — profil enterprise (même machine, flake output différent)
      desktop-work = mkHost {
        host    = "desktop";
        profile = "work";
      };

    };
  };
}
