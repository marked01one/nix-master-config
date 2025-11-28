{ config, pkgs, ... }:

{
  gtk.cursorTheme = {
    name = "Vanilla-DMZ";
    package = pkgs.vanillla-dmz;
    size = 16;
  };
}
