{ ... }:
{

  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Make `docker` invoke Podman directly.
      dockerCompat = true;

      # No Docker API socket needed when dockerCompat wrapper is used.
      dockerSocket.enable = false;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # System-level Podman service only; CLI tools live in Home Manager.
}
