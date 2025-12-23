{pkgs, ...}: {
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
    ".config/yazi/plugins" = {
      source = ./../dotfiles/yazi/plugins;
      recursive = true;
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    # Enable support for RAR extraction.
    package = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;
    };

    # Settings in yazi.toml
    settings = {
      # https://yazi-rs.github.io/docs/next/configuration/yazi#mgr
      mgr = {
        linemode = "size_and_mtime";
        mouse_events = ["click" "scroll" "touch" "move" "drag"];
        ratio = [1 4 3];
        scrolloff = 100;
        show_hidden = false;
        show_symlink = false;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
        sort_sensitive = true;
        sort_translit = true;
        title_format = "{cwd}";
      };

      # https://yazi-rs.github.io/docs/next/configuration/yazi#preview
      preview = {
        wrap = "yes";
        tab_size = 2;
        max_width = 2560;
        max_height = 5120;
        image_filter = "triangle";
        image_quality = 70;
        uberzug_scale = 1.5;
      };
    };
  };
}
