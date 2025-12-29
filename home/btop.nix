{
  pkgs,
  config,
  options,
  ...
}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop;

    settings = {
      color_theme =
        if (options ? stylix && config.stylix.enable)
        then "stylix"
        else "Default";
      vim_keys = true;

      # Graph settings.
      graph_symbol = "braille";
    };
  };
}
