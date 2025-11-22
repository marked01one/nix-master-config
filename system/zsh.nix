# Install and configure `zsh`.
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions = {
      enable = true;
      async = true;
      strategy = [ "history" "completion" ];
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" ];
      patterns = {
        "rm -rf *" = "fg=white,bold,bg=red";
      };
    };

  };
  environment.pathsToLink = [ "/share/zsh" ];
}
