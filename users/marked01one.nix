{
  inputs,
  pkgs,
  ...
}: let
  username = "marked01one";
in {
  # Username for the user of this home manager
  home.username = username;

  # The path to the home directory
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Enable unfree packages.
  nixpkgs.config.allowUnfree = true;

  imports = [
    # Home configuration files.
    ./../home/btop.nix
    ./../home/eww.nix
    ./../home/eza.nix
    ./../home/fastfetch.nix
    ./../home/firefox.nix
    ./../home/gnome.nix
    ./../home/gtk.nix
    ./../home/neovim.nix
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
    ./../home/qt.nix
  ];

  # Packages that does not have declarative configuration.
  home.packages = with pkgs;
    [
      # Flake packages.
      inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default

      # Regular packages
      chromium
      discord
      drawio
      git
      kew
      obsidian
      spotdl
      teams-for-linux
      tokei
      vscode
      youtube-music
      zoom-us

      # Nix IDE Tools.
      alejandra
      nixd
      nil
    ]
    # Custom packages.
    ++ (
      builtins.map (x: (pkgs.callPackage ./../packages/${x}/default.nix {})) [
        "bookokrat"
      ]
    );
}
