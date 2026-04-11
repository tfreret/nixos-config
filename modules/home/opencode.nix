{ pkgs, ... }:

{
  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    permission = {
      bash = {
        "*" = "ask";
        "git *" = "allow";
        "git commit *" = "deny";
        "git push *" = "deny";
        "grep *" = "allow";
      };
    };
  };
}
