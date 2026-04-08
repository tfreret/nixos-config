# Service Management Guide

## Available Services

### Docker (`docker.nix`)
**Purpose**: Container development and deployment  
**Usage**: Development environments, application packaging  
**Enable by importing**: `../../modules/system/services/docker.nix`

**Features**:
- Docker daemon with automatic cleanup (auto-prune)
- User added to docker group for rootless usage
- docker-compose included for multi-container applications

### Tailscale (`tailscale.nix`)
**Purpose**: Secure mesh VPN for remote access  
**Usage**: Connect to home network remotely, access services securely  
**Enable by importing**: `../../modules/system/services/tailscale.nix`

**Features**:
- Automatic firewall configuration
- Trusted interface setup
- Reverse path checking optimization

## Service Management Commands

### Docker
```bash
# Check status
systemctl status docker

# View running containers
docker ps

# View all containers
docker ps -a

# Clean up unused resources
docker system prune

# View resource usage
docker stats
```

### Tailscale
```bash
# Check connection status
sudo tailscale status

# Connect to network
sudo tailscale up

# Get your Tailscale IP address
tailscale ip

# View network routes
sudo tailscale route status

# Disconnect from network
sudo tailscale down
```

## Troubleshooting

### Docker Issues
- **Permission denied**: Ensure user is in docker group, restart session
- **Service not running**: `sudo systemctl start docker`
- **Storage full**: Run `docker system prune -a` to clean up

### Tailscale Issues
- **Cannot connect**: Check `sudo tailscale status` for authentication
- **Slow performance**: Verify firewall settings and network routes
- **Access denied**: Ensure device is authorized in Tailscale admin console

## Security Notes

### Docker
- Containers run as root by default - use user namespaces for security
- Bind mounts can expose host filesystem - be careful with volume mounts
- Network isolation: containers can communicate by default

### Tailscale
- End-to-end encrypted connections
- Zero-trust network access - devices must be explicitly authorized
- Regular key rotation handled automatically