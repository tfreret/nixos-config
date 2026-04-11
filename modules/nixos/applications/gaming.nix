{ config, lib, pkgs, ... }:

{
  options = {
    myApps.gaming.enable = lib.mkEnableOption "Gaming environment with AMD optimizations";
  };

  config = lib.mkIf config.myApps.gaming.enable {
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

    environment.variables = {
      AMD_VULKAN_ICD = "RADV";
      RADV_PERFTEST = "gpl";
    };

    environment.systemPackages = with pkgs; [
      prismlauncher
      heroic
      lutris
    ];

    programs.gamemode.enable = true;
    boot.kernel.sysctl."vm.max_map_count" = 2147483642;
  };
}
