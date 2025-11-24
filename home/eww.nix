{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eww
  ];

  programs.eww = {
    enable = true;
    package = pkgs.eww;
    enableBashIntegration = true;
  };
}
