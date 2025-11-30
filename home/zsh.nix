{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Auto-suggestion settings.
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };

    # Zsh shell aliases.
    shellAliases = {
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
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "zoxide"
        "starship"
      ];
    };

    # Zsh history.
    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
    };
  };
}
