{ pkgs, niri, ... }:

{
  # Using the recommended overlay for niri.
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md#overlaysniri
  nixpkgs.overlays = [ niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  # Define system dependencies for niri.
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    libsecret
    cage
    gamescope
    xwayland-satellite-unstable
  ];

  # Environmental variables
  environment.variables.NIXOS_OZONE_WL = "1";
}
