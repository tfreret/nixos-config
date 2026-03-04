# SSH configuration — reads key paths and hosts from local.nix
{ lib, local, ... }:

let
  p    = local.personal or {};
  w    = local.work     or {};
  pSsh = p.ssh or {};
  wSsh = w.ssh or {};
in
{
  programs.ssh.enable = true;

  # Personal host block (e.g. github.com)
  programs.ssh.matchBlocks."${pSsh.host or "personal-placeholder"}" =
    lib.mkIf ((pSsh.host or "") != "") {
      hostname     = pSsh.host;
      user         = pSsh.user or "git";
      identityFile = pSsh.key  or "~/.ssh/id_ed25519";
    };

  # Work host block (e.g. gitlab.company.com)
  programs.ssh.matchBlocks."${wSsh.host or "work-placeholder"}" =
    lib.mkIf ((wSsh.host or "") != "") {
      hostname     = wSsh.host;
      user         = wSsh.user or "git";
      identityFile = wSsh.key  or "~/.ssh/id_ed25519_work";
    };
}
