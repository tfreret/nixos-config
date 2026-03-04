# Gaming — Steam, launchers, AMD optimisations
{ config, lib, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # AMD Vulkan — force RADV open-source driver
  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
    RADV_PERFTEST  = "gpl";
  };

  environment.systemPackages = with pkgs; [
    prismlauncher  # Minecraft
    heroic         # Epic Games / GOG
    lutris
    # retroarch
    # mangohud
    # gamemode
  ];

  programs.gamemode.enable = true;

  # Required by some games (e.g. Star Citizen)
  boot.kernel.sysctl."vm.max_map_count" = 2147483642;
}
