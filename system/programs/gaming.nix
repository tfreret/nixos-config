# Gaming environment configuration
{ config, lib, pkgs, ... }:

{
  options = {
    myApps.gaming.enable = lib.mkEnableOption "Gaming environment with AMD optimizations";
  };

  config = lib.mkIf config.myApps.gaming.enable {
    # Graphics drivers
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    
    # # AMD optimizations
    # environment.variables = {
    #   AMD_VULKAN_ICD = "RADV";
    #   RADV_PERFTEST = "gpl";
    #   # Enable ACO compiler - faster shader compilation
    #   RADV_DEBUG = "llvm";
    # };
    
    # # GameMode configuration for optimized gaming
    # programs.gamemode = {
    #   enable = true;
    #   settings = {
    #     general = {
    #       renice = 10;                      # Renice game process to reduce latency
    #       inhibit_screensaver = true;       # Prevent screensaver during gaming
    #     };
    #     gpu = {
    #       apply_gpu_optimisations = true;
    #       gpu_device = 0;                   # Use first GPU
    #       amd_performance_level = "high";   # AMD GPU: set to high performance when gaming
    #     };
    #     custom = {
    #       start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
    #       end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
    #     };
    #   };
    # };
    
    # # Performance kernel parameters
    # boot.kernel.sysctl = {
    #   "vm.max_map_count" = 2147483642;
    #   "kernel.sched_autogroup_enabled" = 1; # Better desktop responsiveness
    #   "vm.swappiness" = 10;                 # Reduce swap usage
    # };

    # Steam
    programs.steam = {
      enable = true;
      # remotePlay.openFirewall = true;
      # dedicatedServer.openFirewall = true;
      # localNetworkGameTransfers.openFirewall = true;
      # gamescopeSession.enable = true;
    };
    
    # Gaming tools
    environment.systemPackages = with pkgs; [
      # Gaming launchers
      prismlauncher
      lutris
      # heroic

      # Emulators
      
      # Gaming tools
      # mangohud        # Performance monitoring overlay
      # gamemode        # CPU governor and optimization tool
      # protontricks    # Manage Proton prefixes
      # winetricks      # Configure Wine
      # protonup-qt     # Manage Proton-GE versions
      # gamescope       # Valve's micro-compositor for games
    ];
  };
}