{ pkgs, niri, ... }:

{
  # Using the recommended overlay for niri.
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md#overlaysniri
  nixpkgs.overlays = [ niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  }
  environment.variables.NIXOS_OZONE_WL = "1";
}
