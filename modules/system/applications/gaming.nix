# Gaming setup with performance optimizations
{ config, lib, pkgs, ... }:

{
  options = {
    myApps.gaming.enable = lib.mkEnableOption "Gaming environment with AMD optimizations";
  };

  config = lib.mkIf config.myApps.gaming.enable {
    
    # === STEAM CONFIGURATION ===
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;             # Stream games to other devices
      dedicatedServer.openFirewall = true;       # Host game servers
      localNetworkGameTransfers.openFirewall = true;  # Fast local downloads
      gamescopeSession.enable = true;            # Optimized gaming compositor
    };

    # === GRAPHICS OPTIMIZATIONS ===
    hardware.graphics = {
      enable = true;        # Enable hardware acceleration
      enable32Bit = true;   # Support 32-bit games/libraries
    };

    # === AMD SPECIFIC OPTIMIZATIONS ===
    environment.variables = {
      AMD_VULKAN_ICD = "RADV";     # Use open-source AMD Vulkan driver
      RADV_PERFTEST = "gpl";       # Enable experimental GPL optimizations
    };

    environment.systemPackages = with pkgs; [
      # === GAME LAUNCHERS ===
      prismlauncher        # Minecraft launcher with mod support
      heroic              # Epic Games Store and GOG launcher
      lutris              # Universal game launcher (Wine, emulators)
    ];

    # === SYSTEM OPTIMIZATIONS ===
    programs.gamemode.enable = true;              # Automatic performance tuning
    boot.kernel.sysctl."vm.max_map_count" = 2147483642;  # Required for games like Star Citizen
  };
}