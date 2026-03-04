# Enterprise Home Manager profile
# Work identity is handled via git includeIf in modules/home/git.nix.
# This profile is identical to personal — both read from local.nix.
{ pkgs, lib, local, ... }:

{
  imports = [
    ./personal.nix
  ];
}
