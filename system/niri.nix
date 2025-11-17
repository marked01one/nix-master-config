{ config, pkgs, inputs, ... }:

{
  # Declaring niri.
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  # Declaring addition packages to compliment niri.
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    gamescope
    fuzzel
    unstable.xwayland-satellite
  ];
}
