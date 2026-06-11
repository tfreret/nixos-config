# Architecture Standard (Gold)

This repository targets:
- NixOS + Home Manager (desktop + terminal + terminal/wsl profiles)
- Home Manager only (macOS)
- Home Manager only (other Linux distro)

Primary goals:
- Zero duplication of programs and dotfiles
- Clear separation between NixOS, nix-darwin, and Home Manager concerns
- Simple host composition and fast onboarding

## Non-negotiable rules

1) Home Manager owns user tooling and dotfiles.
   - Git, zsh, tmux, editors, CLI tools, language toolchains.
   - Keep this cross-platform by default.

2) NixOS only owns OS-level concerns.
   - NixOS: kernel, hardware, services, users, boot, networking.

3) Profiles compose modules. Hosts only select profiles.
   - No program/service definitions inside hosts.
   - No host-specific logic inside shared modules.

4) No absolute paths.
   - Use relative imports or pass `self` through `specialArgs`.

5) No duplication of packages across system and home.
   - Tools belong to Home Manager unless the OS requires them.

## Target directory layout

```
hosts/
  workstation/    # NixOS GUI
  dev-vm/         # NixOS CLI
  dev-wsl/        # NixOS CLI + some WSL params

home/
  profiles/       # base, desktop, terminal
  modules/        # git, zsh, tmux, editors, gui, fonts, ssh

system/
  profiles/       # base, desktop, terminal, wsl
  modules/        # core, services, network, hardware

lib/
secrets/ later for ssh key + gpg ?
```

## Profiles: single point of choice

Home Manager profiles:
- home/profiles/base.nix
  Cross-platform basics. Must not depend on NixOS or macOS specifics.
- home/profiles/desktop.nix
  GUI tools and desktop integrations.
- home/profiles/terminal.nix
  CLI-only set.

NixOS profiles:
- system/profiles/base.nix
  Nix settings, users, locale, security defaults.
- system/profiles/desktop.nix
  GUI stack, GPU/audio, gaming, heavy apps.
- system/profiles/terminal.nix
  Headless services, minimal OS packages.
- system/profiles/wsl.nix
  WSL integration only.

macOS setup:
- Home Manager only.
- Homebrew is managed manually outside Nix.

## Hosts: thin composition only

Each host should only:
- set hostName
- import the relevant system profile(s)
- import the relevant home profile(s)
- include host hardware configuration when needed

Example composition goals:
- workstation
  - system: base + desktop
  - home: base + desktop

- dev-vm
  - system: base + terminal
  - home: base + terminal

- dev-wsl
  - system: base + terminal + wsl
  - home: base + terminal

- macbook
  - home: base + desktop

## Flake outputs (canonical)

- nixosConfigurations.workstation
- nixosConfigurations.dev-vm
- nixosConfigurations.dev-wsl
- homeConfigurations.macbook

## Migration policy

1) Build new profile modules first without breaking existing hosts.
2) Wire new profiles in flake outputs.
3) Move existing config into modules.
4) Update hosts to use profiles only.
5) Delete duplicates and old paths after validation.

## Decision log

- Dev tools live in Home Manager for cross-platform reuse.
- Homebrew is managed manually outside Nix on macOS.
