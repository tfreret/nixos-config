# Tailscale VPN Service
# Secure mesh networking for remote access and device connectivity
{ config, pkgs, ... }:

{
  # === TAILSCALE SERVICE ===
  services.tailscale.enable = true;    # Enable Tailscale daemon

  # === FIREWALL CONFIGURATION ===
  networking.firewall = {
    # Trust all traffic from Tailscale interface
    trustedInterfaces = [ "tailscale0" ];
    
    # Optimize reverse path filtering for VPN routing
    checkReversePath = "loose";
    
    # Allow Tailscale UDP traffic on its configured port
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  # === USAGE NOTES ===
  # After enabling, authenticate with: sudo tailscale up
  # View status with: sudo tailscale status  
  # Get IP address with: tailscale ip
  # Configure routing and access controls in Tailscale admin console
}