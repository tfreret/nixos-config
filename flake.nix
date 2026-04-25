{
  description = "NixOS and Home Manager configuration";

  inputs = {
    # Core inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Using flake-parts for modular structure
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    
    # Other inputs
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
  
  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      
      imports = [
        # Comment out these imports as they're causing issues
        # ./hosts     # Host configurations
        # ./lib       # Helper functions
      ];
      
      perSystem = { system, pkgs, ... }: {
        # Per-system outputs
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.git
          ];
          name = "nixos-config";
          shellHook = ''
            echo "Welcome to nixos-config development shell"
          '';
        };
        
        # Custom packages could be defined here
        packages = {
          # Example package
          # my-package = pkgs.callPackage ./pkgs/my-package { };
        };
      };
      
      flake = {
        # Host configurations
        nixosConfigurations = {
          # WSL Development VM configuration
          wsl = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs self; };
            modules = [
              inputs.nixos-wsl.nixosModules.default
              ./hosts/wsl
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs self; };
              }
            ];
          };

          # Desktop configuration
          desktop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs self; };
            modules = [
              ./hosts/desktop
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs self; };
              }
            ];
          };
        };
        
        # Standalone Home Manager configurations if needed
        homeConfigurations = {
          "tfreret-desktop" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = { inherit inputs self; };
            modules = [ ./home/profiles/tfreret-desktop.nix ];
          };
          
          "tfreret-wsl" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = { inherit inputs self; };
            modules = [ ./home/profiles/tfreret-wsl.nix ];
          };
        };
      };
    };
}
