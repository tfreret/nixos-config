# Docker Container Platform
# Provides containerization for development and deployment
{ pkgs, ... }:

{
  # === DOCKER DAEMON CONFIGURATION ===
  virtualisation.docker = {
    enable = true;              # Enable Docker daemon
    autoPrune.enable = true;    # Automatic cleanup of unused containers/images
    # autoPrune.dates = "weekly"; # Weekly cleanup schedule
  };

  # === USER PERMISSIONS ===
  # Add user to docker group for rootless container management
  users.users.tfreret.extraGroups = [ "docker" ];

  # === CONTAINER MANAGEMENT TOOLS ===
  environment.systemPackages = with pkgs; [
    docker-compose            # Multi-container application orchestration
    # Uncomment for additional tools:
    # dive                    # Docker image layer explorer
    # ctop                    # Container monitoring
  ];

  # === NETWORKING ===
  # Docker manages its own network interfaces
  # Default bridge network: docker0
  # Container-to-container communication enabled by default
}
