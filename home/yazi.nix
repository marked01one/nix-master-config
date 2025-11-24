{ config, pkgs, ... }:

{
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
}
