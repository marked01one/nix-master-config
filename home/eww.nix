{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.eww
  ];

  programs.eww = {
    enable = true;
    package = pkgs.unstable.eww;
    enableBashIntegration = true;
  };
}
