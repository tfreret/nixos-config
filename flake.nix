{
  description = "Personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-wsl, home-manager, ... }:
  let
    system = "x86_64-linux";

    mkHost = { host, extraModules ? [] }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs    = true;
            home-manager.useUserPackages  = true;
          }
          ./hosts/${host}/default.nix
        ] ++ extraModules;
      };

  in {
    nixosConfigurations = {
      wsl = mkHost {
        host = "wsl";
        extraModules = [ nixos-wsl.nixosModules.default ];
      };

      desktop = mkHost { host = "desktop"; };

      laptop = mkHost { host = "laptop"; };
    };
  };
}
