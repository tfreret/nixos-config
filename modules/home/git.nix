# Git configuration
# Default identity = personal. Work identity auto-applied under ~/work/.
{ lib, local, ... }:

let
  personalGit = local.git.personal or {};
  workGit     = local.git.work     or {};
in
{
  programs.git = {
    enable = true;

    userName  = personalGit.name  or "";
    userEmail = personalGit.email or "";

    extraConfig = {
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

    # Work identity — auto-applied for any repo cloned under ~/work/
    includes = lib.mkIf ((workGit.email or "") != "") [
      {
        condition = "gitdir:~/work/";
        contents.user = {
          name  = workGit.name  or "";
          email = workGit.email or "";
        };
      }
    ];
  };
}
