# nixos-config

Multi-host NixOS configuration for personal, work, and WSL environments using Flakes, Home Manager, and a graceful local configuration override pattern.

## Quick Start

**Rebuild current host:**
```bash
sudo nixos-rebuild switch --flake .
```

**Rebuild specific host:**
```bash
sudo nixos-rebuild switch --flake .#wsl      # WSL
sudo nixos-rebuild switch --flake .#desktop  # Desktop
sudo nixos-rebuild switch --flake .#laptop   # Laptop
```

## Repository Structure

```
flake.nix              # Flake definition with all inputs/outputs
hosts/
  desktop/            # Desktop configuration
  laptop/             # Laptop configuration  
  wsl/                # WSL configuration
modules/
  home/               # Home Manager user config (imports, nvim, shell, etc)
  system/             # System-level config (packages, services, etc)
users/
  tfreret/            # User-specific profiles
config/               # Configuration files (opencode.json, etc)
```


### Updating Packages to Latest Versions

**Step 1: Update the flake lock file**
```bash
nix flake update
```

This fetches the latest commit from `github:nixos/nixpkgs/nixos-unstable` and updates `flake.lock` with new package versions.

**Step 2: Rebuild to apply new versions**
```bash
sudo nixos-rebuild switch --flake .
```

# Local Configuration Pattern

This NixOS configuration uses a **graceful import pattern** to handle host-specific and work-specific settings without conditional logic or profile parameters.

## How It Works

Each host directory (`wsl/`, `desktop/`, `laptop/`) can optionally contain a `local-config.nix` file:

- **If the file exists**: It's automatically imported and applied
- **If the file doesn't exist**: The configuration gracefully falls back to the baseline personal settings