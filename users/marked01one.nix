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
  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;

  # Enable Home Manager
  programs.home-manager.enable = true;

  imports = [
    # Home configuration files.
    ./../home/eww.nix
    ./../home/eza.nix
    ./../home/fastfetch.nix
    ./../home/firefox.nix
    ./../home/fonts.nix
    ./../home/gnome.nix
    ./../home/gtk.nix
    ./../home/niri.nix
    ./../home/pandoc.nix
    ./../home/prismlauncher.nix
    ./../home/quickshell.nix
    ./../home/qutebrowser.nix
    ./../home/rmpc.nix
    ./../home/starship.nix
    ./../home/stylix.nix
    ./../home/wezterm.nix
    ./../home/yazi.nix
    ./../home/yt-dlp.nix
    ./../home/zoxide.nix
    ./../home/zsh.nix
  ];

  # Packages that does not need configuration.
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
    spotdl
    obsidian
    btop
    drawio
    teams-for-linux
    kew
    zoom-us
    vscode
    youtube-music
    git
    wget
    chromium
    discord

    alejandra
    nixd
  ];
}
