# NixOS, nix-darwin, and Home Manager Configuration

Personal setup to manage dotfiles and OS configuration across all devices.

Targets:
- NixOS desktop workstation (GUI, gaming, LLM inference) -> workstation
- macOS laptop (nix-darwin + Home Manager) -> macbook
- NixOS development VM (terminal only) -> dev-vm
- NixOS WSL development VM (terminal only) -> dev-wsl

> Inspired by fufexan/dotfiles, mitchellh/nixos-config, and NathanFouere/nix-cfg

## Directory Structure

```
nixos-config/
├── flake.nix           # Main flake entry point
├── AGENT.md            # Architecture standard
├── hosts/              # Host-specific configurations
│   ├── workstation/    # NixOS desktop (GUI)
│   ├── dev-vm/         # NixOS VM (CLI)
│   ├── dev-wsl/        # NixOS WSL
│   └── macbook/        # nix-darwin
├── home/               # Home Manager configurations
│   ├── modules/        # Program + dotfiles modules
│   └── profiles/       # base, desktop, terminal
├── system/             # NixOS system configurations
│   ├── modules/        # Core system modules
│   └── profiles/       # base, desktop, terminal, wsl
├── darwin/             # nix-darwin configurations
│   ├── modules/        # macOS system modules
│   └── profiles/       # base (placeholder)
└── secrets/            # Secrets and local/private config material
```

## Usage

### Building a Host

```bash
# Ensure there are no errors
nix flake check --no-build

# Build workstation configuration
sudo nixos-rebuild switch --flake .#workstation

# Build dev VM configuration
sudo nixos-rebuild switch --flake .#dev-vm

# Build WSL configuration
sudo nixos-rebuild switch --flake path:.#dev-wsl  # Use path: for gitignored local-config.nix

# Update flake inputs
nix flake update

# Build macOS configuration
darwin-rebuild switch --flake .#macbook

# Build Home Manager configuration (macOS fallback)
home-manager switch --flake .#macbook

# Development shell
nix develop

nix flake show
```
