{ inputs, pkgs, ... }:
let
  username = "marked01one";
in {
  # Username for the user of this home manager
  home.username = username;

  # The path to the home directory
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  # Enable Home Manager
  programs.home-manager.enable = true;

  imports = [
    # Home configuration files.
    ./../home/eww.nix
    ./../home/firefox.nix
    ./../home/prismlauncher.nix
    ./../home/quickshell.nix
    ./../home/qutebrowser.nix
    ./../home/niri.nix
    ./../home/rmpc.nix
    ./../home/starship.nix
    ./../home/wezterm.nix
    ./../home/zoxide.nix
    ./../home/zsh.nix
  ];
}
