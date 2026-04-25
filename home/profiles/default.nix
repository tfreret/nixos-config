# Import all profiles and expose them
{
  # Main desktop profile
  "tfreret-desktop" = [
    ./tfreret-desktop.nix
  ];
  
  # WSL profile
  "tfreret-wsl" = [
    ./tfreret-wsl.nix
  ];
  
  # Minimal server profile
  "server" = [
    ../terminal/minimal.nix
    ../programs/git.nix
  ];
}