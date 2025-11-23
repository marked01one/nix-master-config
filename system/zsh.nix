# Install and configure `zsh`.
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Auto-suggestion settings.
    autosuggestions = {
      enable = true;
      async = true;
      strategy = [ "history" "completion" ];
    };

    # Zsh shell aliases.
    shellAliases = {
      ll = "ls -a";
      nurse = "sudo nixos-rebuild switch --flake .#$(hostname)";
      homes = "home-manager switch --flake .#$(whoami)@$(hostname)";
    };

    # Syntax highlighting settings.
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" ];
      patterns = {
        "rm -rf *" = "fg=white,bold,bg=red";
      };
    };

  };
  environment.pathsToLink = [ "/share/zsh" ];

  # Dependencies for shell aliases.
  environment.systemPackages = with pkgs; [];
}
