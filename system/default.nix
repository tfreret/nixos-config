# System configuration common between hosts
{
  # Base configuration for desktop machines
  desktop = [
    ./core/default.nix
    ./hardware/default.nix
    ./network/default.nix
    ./nix/default.nix
    ./programs/default.nix
    ./services/default.nix
  ];
  
  # Base configuration for WSL
  wsl = [
    ./core/default.nix
    ./nix/default.nix
    ./network/default.nix
    ./programs/default.nix
    ./services/default.nix
  ];
}