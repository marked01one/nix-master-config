{ config, pkgs, inputs, cwd, ... }:
let
  niri-utils = import ./utils/niri.nix;

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
          { proportion = 1.0 / 3.0; }
          { proportion = 1.0 / 2.0; }
          { proportion = 2.0 / 3.0; }
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

        shadow = {
          softness = 30;
          spread = 5;
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

      binds = with config.lib.niri.actions;
      let
        sh = spawn "sh" "-c";
      in
      lib.attrsets.mergeAttrsList [
        {

        }
        (niri-utils.generate-binds {
          # List of prefixes.
          prefixes."Mod" = "focus";
          prefixes."Mod+Ctrl" = "move";
          prefixes."Mod+Shift" = "focus-monitor";
          prefixes."Mod+Shift+Ctrl" = "move-window-to-monitor";

          # List of suffixes.
          suffixes."Left" = "column-left";
          suffixes."Down" = "window-down";
          suffixes."Up" = "window-up";
          suffixes."Right" = "column-right";

          # List of substitutions.
          substitutions."monitor-column" = "monitor";
          substitutions."monitor-window" = "monitor";
        })
      ];
    };
  };

  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in
{
  imports = [ inputs.niri.homeModules.niri ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = null;
  };

  home.file = {
    ".config/niri" = {
      source = "${dotfiles}/niri";
      recursive = true;
    };
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
