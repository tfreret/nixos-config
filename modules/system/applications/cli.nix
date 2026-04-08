# Command-line utilities - Essential system tools
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # === VERSION CONTROL ===
    git                    # Primary version control system
    
    # === NETWORK UTILITIES ===  
    curl                   # HTTP client for API testing and downloads
    wget                   # Robust file downloader
    
    # === FILE MANAGEMENT ===
    unzip                  # Archive extraction (.zip files)
    gzip                   # File compression and decompression
    
    # === SEARCH & NAVIGATION ===
    fzf                    # Fuzzy finder - interactive file/command search
  ];
}