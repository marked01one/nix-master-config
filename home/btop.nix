{pkgs, ...}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop;

    settings = {
      color_theme = "Default";
      truecolor = true;
      vim_keys = true;

      # Graph settings.
      graph_symbol = "braille";
    };
  };
}
