{ pkgs, ... }:

{
  # Active le démon en arrière-plan
  services.tailscale.enable = true;

  # Ajoute l'interface en ligne de commande locale
  environment.systemPackages = [ pkgs.tailscale ];
}
