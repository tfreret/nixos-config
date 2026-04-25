# Network configuration
{ ... }:

{
  imports = [
    ./tailscale.nix
  ];
  
  # Basic networking configuration
  networking = {
    # Enable NetworkManager for all interfaces
    networkmanager.enable = true;
    
    # Enable DHCP on interfaces that are not managed by NetworkManager
    useDHCP = false;
  };
}