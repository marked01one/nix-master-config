{ config, pkgs, inputs, ... }:

{
  # Enable stylix themeing for GNOME.
  stylix.targets.gnome.enable = true;
  stylix.targets.gnome.useWallpaper = true;
}
