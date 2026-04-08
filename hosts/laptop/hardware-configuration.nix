# Minimal hardware configuration for laptop
# Run `nixos-generate-config` to generate proper hardware config
{
  imports = [ ];

  # Placeholder hardware configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}