# Docker configuration
{ pkgs, ... }:

{
  # Enable Docker with auto-pruning
  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = [ "--all" "--volumes" ];
    };
    
    # Enable Buildkit for better performance
    enableOnBoot = true;
    daemon.settings = {
      features = {
        buildkit = true;
      };
    };
  };
  
  # Add the user to the docker group
  users.users.tfreret.extraGroups = [ "docker" ];
  
  # Install Docker-related tools
  environment.systemPackages = with pkgs; [
    docker-compose
    lazydocker
  ];
}