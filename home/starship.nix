{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.unstable.starship;

    # Configuration written to `$XDG_CONFIG_HOME/starship.toml`.
    # For the full list of options, see: https://starship.rs/config/
    settings = {
      add_newline = false;
      format = lib.concatString [
        "$line_break"
        "$package"
        "$line_break"
        "$character"
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "➜";
        error_symbol = "➜";
      };
    };
  };
}
