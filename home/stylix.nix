{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  imports = [inputs.stylix.homeModules.stylix];

  stylix = {
    # Base configs.
    enable = true;
    enableReleaseChecks = false;
    autoEnable = true;

    # Image configs.
    image = ./../assets/wallpapers/tumblr-luminousslime-003.jpg;

    # Disable stylings for specific target apps.
    targets = {
      firefox.enable = false;
      wezterm.enable = true;
      gtk = {
        enable = true;
        # Disable fonts since we're using the system-provided fonts in
        # {PROJECT_ROOT}/system/fonts.nix
        fonts.enable = false;
      };

      gnome = {
        enable = true;
        # Disable fonts since we're using the system-provided fonts in
        # {PROJECT_ROOT}/system/fonts.nix
        fonts.enable = false;

        polarity.enable = true;
        polarity.override = "dark";
      };
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans Light";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans Light";
      };
    };
  };

  # Declare all 16 base16 colors as session variables to be used by applications
  # not controlled by Home Manager.
  home.sessionVariables = builtins.listToAttrs (
    builtins.genList (x: {
      name = "STYLIX_BASE_0${lib.toHexString x}";
      value = colors."base0${lib.toHexString x}";
    })
    15
  );
}
