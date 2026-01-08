{config, ...}: {
  dconf.settings = {
    "org/gnome/desktop/default-applications" = {
      terminal =
        if (config.programs.wezterm.enable)
        then "wezterm"
        else "xterm";
    };
  };
}
