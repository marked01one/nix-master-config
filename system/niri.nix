{ config, pkgs, inputs, ... }:
# let
#   settings = {
#     strix-g18 = {
#       input = {
#         xkb.layout = "us";
#         numlock = false;
# 
#         touchpad = {
#           tap = true;  # Enable tap-to-click.
#           dwt = true;  # Disable trackpad when typing.
#           tap-button-map = "left-right-middle";
#           click-method = "clickfinger";
#         };
# 
#         tablet.map-to-output = "eDP-1";
#         touch.map-to-output = "eDP-1";
# 
#         prefer-no-csd = true;
# 
#         layout = {
#           gaps = 8;
#           center-focused-column = "never";
#           always-center-single-column = true;
# 
#           preset-column-widths
#         };
# 
#         window-rules =
#         let
#           colors = config.lib.stylix.colors.withHashtag;
#         in [
#           {
#             draw-border-with-background = false;
#             clip-to-geometry = true;
#             geometry-corner-radius =
#               let
#                 r= 8.0;
#               in
#               {
#                 top-left = r;
#                 top-right = r;
#                 bottom-left = r;
#                 bottom-right = r;
#               };
#           }
#           {
#             matches = [
#               {
#                 app-id = "^wezterm$";
#               }
#             ];
#           }
#           {
#             matches = [
#               app-id = "firefox$";
#               title = "^Picture-in-Picture$";
#             ];
#             open-floating = true;
#             default-column-width.fixed = 480;
#             default-column-height.fixed = 270;
#           }
#         ];
#       };
#     };
#   };
# in
{
  # Declaring niri.
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    # settings = settings.${config.networking.hostName};
  };

  # Declaring addition packages to compliment niri.
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    gamescope
    fuzzel
    xwayland-satellite
  ];
}
