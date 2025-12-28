{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;

    cursorTheme = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
      size = 16;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
