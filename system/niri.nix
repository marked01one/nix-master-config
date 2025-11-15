{ pkgs, ... }:

{
  # Declaring niri.
  programs.niri = {
    enable = true;
    package = pkgs.unstable.niri;
  };
  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    gamescope
    fuzzel
    unstable.xwayland-satellite
  ];
}
