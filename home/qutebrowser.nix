{ config, pkgs, ... }:

{
  programs.qutebrowser.enable = true;

  home.packages = with pkgs; [
    unstable.qutebrowser
  ];
}
