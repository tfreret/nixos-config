{ pkgs, ... }:

{
  virtualisation.docker = {
    enable            = true;
    autoPrune.enable  = true;
  };

  users.users.tfreret.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
