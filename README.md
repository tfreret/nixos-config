# NixOS Configuration

My personal NixOS and Home Manager configuration using flakes and a modular structure.
This configuration has been reorganized to follow a structure similar to [fufexan/dotfiles](https://github.com/fufexan/dotfiles) for better maintainability.

I have 2 main use cases:
- Desktop system for everyday use
- WSL development environment for work

> Inspired by fufexan/dotfiles, mitchellh/nixos-config, and NathanFouere/nix-cfg

## Directory Structure

```
nixos-config/
├── flake.nix           # Main flake entry point
├── home/               # Home Manager configurations
│   ├── editors/        # Editor configurations (neovim, vscode)
│   ├── profiles/       # User profiles for different hosts
│   ├── programs/       # Program configurations (git, ssh)
│   ├── services/       # Service configurations
│   └── terminal/       # Terminal configurations (shell, tmux)
├── hosts/              # Host-specific configurations
│   ├── desktop/        # Desktop host
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   └── wsl/            # WSL host
│       ├── default.nix
│       └── local-config.nix
├── lib/                # Helper functions
├── pkgs/               # Custom packages
└── system/             # System configurations common between hosts
    ├── core/           # Core system configs
    ├── hardware/       # Hardware configs
    ├── network/        # Network configs
    ├── nix/            # Nix settings
    ├── programs/       # System-level programs
    └── services/       # System-level services
```

## Usage

### Building a Host

```bash
# Ensure there are no errors
nix flake update

# Build desktop configuration
sudo nixos-rebuild switch --flake .#desktop

# Build WSL configuration
sudo nixos-rebuild switch --flake path:.#wsl  # Use path: for gitignored local-config.nix

# Update flake inputs
nix flake update

# Build desktop home configuration
home-manager switch --flake .#tfreret-desktop

# Build WSL home configuration
home-manager switch --flake .#tfreret-wsl

# Development shell
nix develop
```