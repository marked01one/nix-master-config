{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.eza;
    git = true;
    colors = "always";
    icons = "always";
  };
}
