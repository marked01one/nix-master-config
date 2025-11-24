{ config, pkgs, cwd, ... }:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;  # Support for RAR extraction
    };
  };

  home.packages = with pkgs; [
    fd
    ffmpeg
    file
    fzf
    glow
    imagemagick
    jq
    ouch
    poppler
    resvg
    ripgrep
    wl-clipboard
    zoxide
  ];

  home.file = {
    ".config/yazi" = {
      source = "${dotfiles}/yazi";
      recursive = true;
    };
  };
}
