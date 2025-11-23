{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.unstable.starship;

    # Configuration written to `$XDG_CONFIG_HOME/starship.toml`.
    # For the full list of options, see: https://starship.rs/config/
    settings = {
      add_newline = false;
      format = ''
        $username@$hostname :: $all
        $directory$character
      '';
      scan_timeout = 10;
      character = {
        success_symbol = "➜";
        error_symbol = "➜";
      };

      # Directory option.
      directory = {
        truncation_length = 2;
        truncate_to_repo = true;
        truncation_symbol = ".../";
      };

      # Git branch options.
      git_branch = {
        always_show_remote = false;
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        style = "bold purple";
      };

      # Hostname options.
      hostname = {
        format = "[$ssh_symbol$hostname]($style)";
        ssh_only = false;
        style = "underline bold dimmed green";
      };

      # Username options.
      username = {
        format = "[$user]($style)";
        show_always = true;
        style_root = "bold red";
        style_user = "bold yellow";
      };
    };
  };
}
