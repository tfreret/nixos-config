# Git configuration — personal identity hardcoded here
# Work identity: override programs.git in hosts/wsl/local-config.nix
{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name  = "tfreret";
      user.email = "freret.tom@gmail.com";

      init.defaultBranch   = "main";
      pull.rebase          = true;
      push.autoSetupRemote = true;
      rebase.autoStash     = true;
      color.ui             = "auto";
      core = {
        autocrlf = "input";
        editor   = "vim";
      };
      alias = {
        st   = "status -sb";
        lg   = "log --oneline --graph --decorate --all";
        undo = "reset --soft HEAD~1";
        wip  = "!git add -A && git commit -m 'wip'";
      };
    };
  };
}
