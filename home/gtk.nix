{pkgs, ...}: {
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
      size = 16;
    };
  };
}
