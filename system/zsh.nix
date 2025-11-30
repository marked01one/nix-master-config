# Install and configure `zsh`.
{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  # Dependencies for shell aliases.
  environment.systemPackages = with pkgs; [];
}
