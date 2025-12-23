{pkgs, ...}: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.wezterm;
  };

  home.file = {
    ".config/wezterm" = {
      source = ./../dotfiles/wezterm;
      recursive = true;
    };
  };
}
