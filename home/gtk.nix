{ config, pkgs, ... }:

{
  gtk.cursorTheme = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 16;
  };
}
