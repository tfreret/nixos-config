# NixOS and Home Manager Configuration

```
macbook fresh install
home-manager switch --flake .#macbook

zram zswap pour desktop

```



Personal setup to manage dotfiles and OS configuration across all devices.

Targets:
- NixOS desktop workstation (GUI, gaming, LLM inference) -> workstation
- macOS laptop (Home Manager only) -> macbook
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
│   └── macbook/        # removed (HM-only on macOS)
├── home/               # Home Manager configurations
│   ├── modules/        # Program + dotfiles modules
│   └── profiles/       # base, desktop, terminal
├── system/             # NixOS system configurations
│   ├── modules/        # Core system modules
│   └── profiles/       # base, desktop, terminal, wsl
├── darwin/             # removed (HM-only on macOS)
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

# Build Home Manager configuration (macOS)
home-manager switch --flake .#macbook

# Development shell
nix develop

nix flake show
```

## Migration Test Plan (manual to Home Manager)

### A. Preflight checks

```bash
nix --version
home-manager --version
```

### B. Activation sanity

```bash
home-manager switch --flake .#macbook
```

### C. Home Manager verification

- Confirm any managed dotfiles were backed up with `*.bak` on first activation
- Validate managed configs (zsh, git, tmux, nvim) match your modules

### D. PATH and tooling resolution

```bash
which git
which zsh
which python
which go
which node
go version
python --version
node --version
pnpm --version
bun --version
```

### E. Homebrew boundary

```bash
brew list --cask
brew leaves
```

### F. Podman

```bash
podman --version
podman machine init
podman machine start
```

### G. Rollback

- Re-run `home-manager switch --flake .#macbook` after fixing config
- Restore from `*.bak` if needed

## Todos
- [ ] manage secrets
