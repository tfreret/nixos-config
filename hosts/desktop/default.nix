# # Dekstop NixOS host configuration
# { config, pkgs, ... }:

# {
#   imports = [
#     ./hardware-configuration.nix
#     ../../modules/common.nix
#   ];

#   networking = {
#     hostName = "desktop";
#     networkmanager.enable = true;
#   };

#   # Bootloader
#   boot.loader = {
#     systemd-boot.enable      = true;
#     efi.canTouchEfiVariables = true;
#   };

#   # Sound (PipeWire)
#   security.rtkit.enable = true;
#   services.pipewire = {
#     enable           = true;
#     alsa.enable      = true;
#     alsa.support32Bit = true;
#     pulse.enable     = true;
#   };

#   system.stateVersion = "25.11";
# }
