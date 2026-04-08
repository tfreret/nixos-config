#!/usr/bin/env bash
# Simple NixOS rebuild helper script
# Automatically detects hostname and handles local-config gracefully

set -euo pipefail

hostname=$(hostname)
flake_dir="$HOME/.config/nixos-config"

# Change to flake directory
cd "$flake_dir"

echo "🔄 Rebuilding NixOS configuration for: $hostname"

# Check if local-config exists (affects flake reference)
if [[ -f "hosts/$hostname/local-config.nix" ]]; then
    echo "🔧 Local config detected, using impure build..."
    flake_ref="path:$flake_dir#$hostname" 
    extra_args="--impure"
else
    echo "✨ Pure configuration, using standard flake reference..."
    flake_ref=".#$hostname"
    extra_args=""
fi

# Get the action (default: switch)
action="${1:-switch}"

case "$action" in
    "build")
        echo "🔨 Building configuration..."
        nixos-rebuild build --flake "$flake_ref" $extra_args
        ;;
    "test")
        echo "🧪 Testing configuration..."
        nixos-rebuild test --flake "$flake_ref" $extra_args
        ;;
    "switch")
        echo "🚀 Switching to new configuration..."
        nixos-rebuild switch --flake "$flake_ref" $extra_args
        echo "✅ System rebuilt successfully!"
        echo "📊 Current generation: $(nixos-version)"
        ;;
    "rollback")
        echo "↩️  Rolling back to previous generation..."
        nixos-rebuild switch --rollback
        ;;
    *)
        echo "Usage: $0 [build|test|switch|rollback]"
        echo "Default: switch"
        exit 1
        ;;
esac

echo "✅ Operation '$action' completed successfully!"