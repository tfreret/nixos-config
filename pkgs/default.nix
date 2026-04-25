# Custom package definitions
{ self, ... }: {
  perSystem = { pkgs, ... }: {
    packages = {
      # Example: include any custom packages here
      # my-custom-package = pkgs.callPackage ./my-custom-package {};
    };
  };
}