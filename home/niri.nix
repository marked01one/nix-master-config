{ config, pkgs, inputs, cwd, ... }:
let
  settings = {
    strix-g18 = {
      input = {
        keyboard.xkb.layout = "us";

        touchpad = {
          tap = true;  # Enable tap-to-click.
          dwt = true;  # Disable trackpad when typing.
          tap-button-map = "left-right-middle";
          click-method = "clickfinger";
        };

        tablet.map-to-output = "eDP-1";
        touch.map-to-output = "eDP-1";
      };

      prefer-no-csd = true;

      layout = {
        gaps = 8;
        center-focused-column = "never";
        always-center-single-column = true;

        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];

        default-column-display = "tabbed";
        # Hide the tab indicator when there's only one window in a column.
        tab-indicator.hide-when-single-tab = true;

        # Default width of new windows, proportional to window size.
        default-column-width.proportion = 1.0;

        focus-ring = {
          width = 2;

          active.color = "#7fc8ff";  # TODO: Migrate this value to stylix.
          inactive.color = "#505050"; # TODO: Migrate this value to stylix.
        };
      };

      window-rules =
      let
        # TODO: Migrate this value to stylix.
        # colors = config.lib.stylix.colors.withHashtag;
      in [
        # Global window rules.
        {
          draw-border-with-background = false;
          clip-to-geometry = true;
          geometry-corner-radius =
            let
              # Border radius.
              r = 8.0;
            in
            {
              top-left = r;
              top-right = r;
              bottom-left = r;
              bottom-right = r;
            };
        }
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
          default-column-width.fixed = 480;
          default-window-height.fixed = 270;
        }
      ];
    };
  };
in
{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  # Declaring addition packages to compliment niri.
  home.packages = with pkgs; [
    wl-clipboard
    wayland-utils
    gamescope
    fuzzel
    xwayland-satellite
  ];

}
