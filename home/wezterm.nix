{ config, pkgs, cwd, ... }:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.wezterm;
  };

  home.file = {
    ".config/wezterm" = {
      source = "${dotfiles}/wezterm";
      recursive = true;
    };
  };
}
