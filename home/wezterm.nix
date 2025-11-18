{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    package = pkgs.unstable.wezterm;
  };

  home.packages = with pkgs; [ unstable.wezterm ];
}
