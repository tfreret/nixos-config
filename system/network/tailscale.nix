# Tailscale configuration
{ pkgs, ... }:

{
  # Enable Tailscale
  services.tailscale = {
    enable = true;
    
    # # Enable Tailscale SSH
    # useRoutingFeatures = "client";
    
    # # Automatically authorize and connect to tailnet
    # authKeyFile = "/var/lib/tailscale/authkey";
    
    # # Extra options when starting tailscale
    # extraUpFlags = [
    #   "--ssh"
    #   "--advertise-exit-node"
    # ];
  };
  
  # Allow Tailscale to access and configure firewall
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
  
    # # Allow Tailscale traffic
    # allowedUDPPorts = [ 41641 ];
    # # Check all outgoing connections
    # checkReversePath = "loose";
  };
  
  # Install Tailscale utilities
  environment.systemPackages = with pkgs; [
    tailscale
    tailscale-systray
  ];
}