# System services configuration
{ ... }:

{
  imports = [
    ./docker.nix
    ./llama-cpp-server.nix
  ];
  
  # Enable llama.cpp inference server for desktop
  services.llama-cpp-server = {
    enable = false; # Disabled by default, enable in desktop configuration
    host = "127.0.0.1";
    port = 8080;
    contextSize = 4096;
    threads = 4;
    gpu = true;
  };
}