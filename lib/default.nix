# Helper functions for the flake
{ self, ... }: {
  flake = {
    # Example lib functions to expose
    lib = {
      # Reexport mkHomeConfiguration and mkNixosConfiguration in your flake
      mkHomeConfiguration = { username, hostname, system ? "x86_64-linux", ... }@args:
        self.inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = self.inputs.nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit self; };
          modules = [
            ../home/profiles/${username}-${hostname}.nix
          ] ++ (args.modules or []);
        };
        
      # You can add more helper functions here
    };
  };
}