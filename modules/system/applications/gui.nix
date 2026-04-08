# Graphical applications - Desktop productivity and creative tools
{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # === WEB BROWSERS ===
    firefox               # Primary browser - daily browsing
    chromium             # Secondary browser - testing/development
    inputs.zen-browser.packages."${pkgs.system}".default  # Privacy-focused browser
    
    # === DEVELOPMENT ENVIRONMENT ===
    vscode               # Primary IDE - code editing and debugging
    ghostty              # Modern GPU-accelerated terminal emulator
    
    # === PRODUCTIVITY & ORGANIZATION ===
    obsidian             # Knowledge management - notes and documentation
    thunderbird          # Email client - communication
    
    # === CLOUD SERVICES ===
    nextcloud-client     # File synchronization and backup
    
    # === COMMUNICATION ===
    discord              # Team chat and community communication
    
    # === MEDIA & CREATIVITY ===
    vlc                  # Universal media player
    obs-studio          # Screen recording and live streaming
    gimp                # Raster image editing and photo manipulation
    blender             # 3D modeling, animation, and rendering
    freecad             # Parametric 3D CAD modeling
    
    # === AI & MACHINE LEARNING ===
    lmstudio            # Local large language model runner
  ];
}