# Docker — daemon + CLI
# Adds tfreret to the docker group for rootless usage
{ pkgs, ... }:

{
  virtualisation.docker = {
    enable          = true;
    autoPrune.enable = true;
  };

  users.users.tfreret.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
