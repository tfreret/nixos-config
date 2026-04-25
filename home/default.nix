# Home Manager configuration common between hosts
{ pkgs, ... }: {
  # Common home-manager settings go here
  home.stateVersion = "23.11";
  
  # Enable fontconfig to discover user-installed fonts
  fonts.fontconfig.enable = true;
  
  # Allow unfree packages (if needed)
  nixpkgs.config.allowUnfree = true;
}