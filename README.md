# nixos-config

```
   sudo nixos-rebuild switch --flake .#dev-vm
```


# Local Configuration Pattern

This NixOS configuration uses a **graceful import pattern** to handle host-specific and work-specific settings without conditional logic or profile parameters.

## How It Works

Each host directory (`wsl/`, `desktop/`, `laptop/`) can optionally contain a `local-config.nix` file:

- **If the file exists**: It's automatically imported and applied
- **If the file doesn't exist**: The configuration gracefully falls back to the baseline personal settings

This is achieved using `builtins.pathExists` in each host's `default.nix`:

```nix
imports = [
  # ... standard configs ...
  
  # Graceful import: load ./local-config.nix if it exists
  (if builtins.pathExists ./local-config.nix then ./local-config.nix else {})
];
```

## Usage

### Baseline (No Local Config)

By default, every host uses the `personal.nix` profile with personal git identity, shell configuration, and standard modules.

```
flake build/switch → uses personal.nix (no local-config.nix needed)
```

### Adding Work Configuration

To add work-specific settings to a host:

1. **Copy the example template** to create the actual file:
   ```bash
   cd hosts/wsl  # or desktop/laptop
   cp local-config.nix.example local-config.nix
   ```

2. **Edit `local-config.nix`** to override specific settings:
   ```nix
   { config, pkgs, lib, local, ... }:

   {
     programs.git.config = {
       user.email = "your.name@enterprise.com";
       user.name = "Your Name (Work)";
     };

     environment.systemPackages = with pkgs; [
       slack
       azure-cli
       kubectl
     ];

     programs.bash.shellAliases = {
       work-vpn = "az login && vpn-connect";
     };
   }
   ```

3. **Rebuild and switch**:
   ```bash
   sudo nixos-rebuild switch --flake .#dev-vm
   ```

## Key Benefits

✅ **No if-statements** — Settings are cleanly separated  
✅ **Git-safe** — `local-config.nix` is in `.gitignore`  
✅ **Silent fallback** — Missing file doesn't break the build  
✅ **Flexible inheritance** — Can override any NixOS option  
✅ **Single flake output** — No need for separate configs like `desktop-work`  

## Example Scenarios

### Scenario 1: WSL for Personal Use
- Only personal git identity from `local.nix`
- No `local-config.nix` needed

### Scenario 2: WSL for Work
- Create `hosts/wsl/local-config.nix`
- Override git identity, add enterprise packages
- Personal config remains as baseline for everything else

### Scenario 3: Shared Laptop (Personal + Work)
- Personal baseline with personal git config
- Create `hosts/laptop/local-config.nix` for work overrides
- Rebuild as needed; rebuild again without the file to go back to personal

## Migration from Profile-Based Setup

The old setup used profiles and conditional logic:
```nix
# OLD - avoid this
mkHost = { host, profile ? "personal", ... }
home-manager.users.tfreret = import ../../users/tfreret/${profile}.nix;
```

The new setup is simpler:
```nix
# NEW - cleaner!
mkHost = { host, ... }
home-manager.users.tfreret = import ../../users/tfreret/personal.nix;
# Override via local-config.nix if needed
```

## Files Being Used

- **Baseline personal**: `users/tfreret/personal.nix` (git, shell, dev modules)
- **Global secrets**: `local.nix` (user email/name for git includeIf, still used)
- **Host-specific work settings**: `hosts/*/local-config.nix` (gitignored)

### When to Use Each

| Setting | Where | Reason |
|---------|-------|--------|
| Global git identity | `local.nix` | Shared across all hosts |
| Personal home config | `users/tfreret/personal.nix` | Baseline for all machines |
| Work git+tools for ONE host | `hosts/*/local-config.nix` | Host-specific, never committed |

## Tips

- Use `builtins.readFile` in `local-config.nix` to import sensitive files
- SSH keys can be managed through home-manager in `local-config.nix`
- Corporate proxies/DNS go in `environment.variables` within `local-config.nix`
- Keep `local.nix` for truly global secrets (GPG keys, base identities)



for personal work inside dev-em enterpise version just use git config inside the repo the rest is not interesting