# SSH client configuration
# Work-specific host blocks go in hosts/wsl/local-config.nix
{ ... }:

{
  programs.ssh = {
    enable         = true;
    addKeysToAgent = "yes";
  };
}
