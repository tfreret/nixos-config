# Git configuration
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
        editor   = "nvim";
      };
      alias = {
        st   = "status -sb";
        lg   = "log --oneline --graph --decorate --all";
        d    = "diff";
        p    = "push";
        pl   = " pull";
      };
    };
  };
}
