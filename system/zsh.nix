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

    # Oh My Zsh plugins configuration.
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "zoxide"
        "starship"
      ];
    };

    # Zsh history.
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
  };
  environment.pathsToLink = [ "/share/zsh" ];

  # Dependencies for shell aliases.
  environment.systemPackages = with pkgs; [];
}
