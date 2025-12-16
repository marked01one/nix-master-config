{ config, pkgs, cwd, ... }:

{
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
    # Avoid out-of-store file installation errors by specifying only Lua files
    # to be symlinked out-of-store.
    ".config/yazi/init.lua".source = ./../dotfiles/yazi/init.lua;
    ".config/yazi/yazi.toml".source = ./../dotfiles/yazi/yazi.toml;
    ".config/yazi/plugins" = {
      source = ./../dotfiles/yazi/plugins;
      recursive = true;
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;  # Support for RAR extraction
    };
  };
}
