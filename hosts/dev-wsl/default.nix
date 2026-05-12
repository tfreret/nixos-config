{ lib, ... }:

{
  imports = [
    ../../system/profiles/terminal.nix
    ../../system/profiles/wsl.nix
    (if builtins.pathExists ./local-config.nix then ./local-config.nix else {})
  ];

  wsl = {
    enable = true;
    defaultUser = "tfreret";
    startMenuLaunchers = false;
    wslConf = {
      automount.root = "/mnt";
      interop.appendWindowsPath = true;
      network.generateHosts = true;
    };
  };

  networking.hostName = "dev-wsl";

  # WSL has no direct Wi-Fi device; avoid starting wpa_supplicant.
  networking.wireless.enable = lib.mkForce false;
  systemd.services.wpa_supplicant.enable = false;

  # Rootless Podman on WSL needs a runtime dir and works better with cgroupfs.
  systemd.tmpfiles.rules = [
    "d /run/user/1000 0700 tfreret users -"
  ];
  virtualisation.containers.containersConf.settings.engine.cgroup_manager = "cgroupfs"; # Updated to configure cgroup manager for WSL

  home-manager.users.tfreret = import ../../home/profiles/terminal.nix;

  system.stateVersion = "25.11";
}
