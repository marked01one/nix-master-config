{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  niri-binds = import ./utils/niri-binds.nix;

  niri-settings = {
    strix-g18 = {
      input = {
        keyboard.xkb.layout = "us";

        touchpad = {
          tap = true; # Enable tap-to-click.
          dwt = true; # Disable trackpad when typing.
          tap-button-map = "left-right-middle";
          click-method = "clickfinger";
        };

        tablet.map-to-output = "eDP-1";
        touch.map-to-output = "eDP-1";
      };

      prefer-no-csd = true;

      layout = let
        colors = config.lib.stylix.colors.withHashtag;
      in {
        gaps = 8;
        center-focused-column = "never";
        always-center-single-column = true;

        preset-column-widths = [
          {proportion = 1.0 / 3.0;}
          {proportion = 1.0 / 2.0;}
          {proportion = 2.0 / 3.0;}
        ];

        default-column-display = "tabbed";
        # Hide the tab indicator when there's only one window in a column.
        tab-indicator.hide-when-single-tab = true;

        # Default width of new windows, proportional to window size.
        default-column-width.proportion = 1.0;

        focus-ring = {
          width = 2;

          active.color = colors.base07;
          inactive.color = colors.base00;
        };

        shadow = {
          softness = 30;
          spread = 5;
        };
      };

      window-rules = let
        colors = config.lib.stylix.colors.withHashtag;
      in [
        # Global window rules.
        {
          draw-border-with-background = false;
          clip-to-geometry = true;
          geometry-corner-radius = let
            # Border radius.
            r = 8.0;
          in {
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
        {
          matches = [
            {
              app-id = "^firefox$";
              title = "^Private Browsing$";
            }
          ];
          border.active.color = colors.base08;
        }
      ];

      binds = with config.lib.niri.actions; let
        sh = spawn "sh" "-c";
      in
        lib.attrsets.mergeAttrsList [
          {
            "Mod+T".action = spawn "wezterm";
            "Mod+O".action = show-hotkey-overlay;

            # Audio keybinds.
            "XF86AudioRaiseVolume" = {
              action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
              allow-when-locked = true;
            };
            "XF86AudioLowerVolume" = {
              action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
              allow-when-locked = true;
            };
            "XF86AudioMute" = {
              action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              allow-when-locked = true;
            };
            "XF86AudioMicMute" = {
              action = sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
              allow-when-locked = false;
            };

            # Monitor brightness keybinds.
            "XF86MonBrightnessUp".action = sh "brightnessctl set 10%+";
            "XF86MonBrightnessDown".action = sh "brightnessctl set 10%-";
          }
          (
            niri-binds {
              prefixes."Mod" = "focus-column";
              prefixes."Mod+Ctrl" = "move-column-to";

              suffixes."Home" = "first";
              suffixes."End" = "last";
            }
          )
          (
            # Generate keybinds for navigation between windows and workspaces
            # iteratively.
            niri-binds {
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
              suffixes."H" = "column-left";
              suffixes."J" = "window-down";
              suffixes."K" = "window-up";
              suffixes."L" = "column-right";

              # List of substitutions.
              substitutions."monitor-column" = "monitor";
              substitutions."monitor-window" = "monitor";
            }
          )
          (
            # Generate keybinds for `Mod` and `Mod+Ctrl` for all numbered
            # workspaces (from 1 to 9).
            niri-binds {
              # List of prefixes.
              prefixes."Mod" = "focus";
              prefixes."Mod+Ctrl" = "move-window-to";

              # List of suffixes.
              suffixes = builtins.listToAttrs (
                map (n: {
                  name = toString n;
                  # workspace 1 is empty; workspace 2 is the logical first.
                  value = ["workspace" (n + 1)];
                }) (lib.range 1 9)
              );
            }
          )
        ];
    };
  };
in {
  imports = [inputs.niri.homeModules.niri];
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = niri-settings.strix-g18;
  };

  # Declaring addition packages to compliment niri.
  home.packages = with pkgs; [
    wl-clipboard
    wayland-utils
    gamescope
    fuzzel
    xwayland-satellite

    brightnessctl # Read and control device brightness.
  ];
}
