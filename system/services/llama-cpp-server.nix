# Llama.cpp inference server configuration
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.llama-cpp-server;
in {
  options.services.llama-cpp-server = {
    enable = mkEnableOption "llama.cpp inference server";
    
    package = mkOption {
      type = types.package;
      default = pkgs.llama-cpp;
      description = "Package to use for llama.cpp";
    };
    
    modelPath = mkOption {
      type = types.str;
      default = "/var/lib/llama-cpp-server/model.gguf";
      description = "Path to the model file";
    };
    
    host = mkOption {
      type = types.str;
      default = "127.0.0.1";
      description = "Host to bind the server to";
    };
    
    port = mkOption {
      type = types.int;
      default = 8080;
      description = "Port to bind the server to";
    };
    
    contextSize = mkOption {
      type = types.int;
      default = 2048;
      description = "Context size for the model";
    };
    
    threads = mkOption {
      type = types.int;
      default = 4;
      description = "Number of threads to use";
    };
    
    gpu = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to use GPU acceleration";
    };
  };
  
  config = mkIf cfg.enable {
    # Create the directory for models
    systemd.tmpfiles.rules = [
      "d /var/lib/llama-cpp-server 0755 root root -"
    ];
    
    # Create the systemd service
    systemd.services.llama-cpp-server = {
      description = "Llama.cpp inference server";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      
      serviceConfig = {
        ExecStart = ''
          ${cfg.package}/bin/llama-server \
            --model ${cfg.modelPath} \
            --host ${cfg.host} \
            --port ${toString cfg.port} \
            --ctx-size ${toString cfg.contextSize} \
            --threads ${toString cfg.threads} \
            ${optionalString cfg.gpu "--n-gpu-layers 99"}
        '';
        Restart = "on-failure";
        RestartSec = "10s";
        User = "root";
        Group = "root";
        WorkingDirectory = "/var/lib/llama-cpp-server";
      };
    };
    
    # Install llama.cpp and tools
    environment.systemPackages = with pkgs; [
      cfg.package
      ollama # Alternative LLM server
    ];
    
    # Open the port in the firewall
    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}