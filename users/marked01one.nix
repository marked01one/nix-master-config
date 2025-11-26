{ inputs, pkgs, ... }:
let
  username = "marked01one";
in
{
  nixpkgs.config.allowUnfree = true;
  # Username for the user of this home manager
  home.username = username;

  # The path to the home directory
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = true;

  # Enable Home Manager
  programs.home-manager.enable = true;

  imports = [
    # Home configuration files.
    ./../home/eww.nix
    ./../home/eza.nix
    ./../home/firefox.nix
    ./../home/niri.nix
    ./../home/prismlauncher.nix
    ./../home/quickshell.nix
    ./../home/qutebrowser.nix
    ./../home/rmpc.nix
    ./../home/starship.nix
    ./../home/wezterm.nix
    ./../home/yazi.nix
    ./../home/zoxide.nix
    ./../home/zsh.nix
    ./../home/fastfetch.nix
    ./../home/fonts.nix
  ];

  # Packages that does not need configuration.
  home.packages = with pkgs;[
    inputs.zen-browser.packages.${system}.default
    spotdl
    obsidian
    btop
    pandoc
    drawio
    teams-for-linux
    kew
    zoom-us
  ];
}
