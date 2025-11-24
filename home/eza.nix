{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.unstable.eza;
    git = true;
    colors = "always";
    icons = "always";
  };
}
