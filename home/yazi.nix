{ config, pkgs, cwd, ... }:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in {
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
    ".config/yazi/init.lua" = {
      source = "${dotfiles}/yazi/init.lua";
    };
    "./config/yazi/plugins" = {
      source = "${dotfiles}/yazi/plugins";
      recursive = true;
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;  # Support for RAR extraction
    };

    # Configuration written to `$HOME/.config/yazi/yazi.toml`.
    settings = {
      mgr = {
        ratio = [1 4 3];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = true;
        linemode = "size_and_mtime";
      };
    };
  };
}
