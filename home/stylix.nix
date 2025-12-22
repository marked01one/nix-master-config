{ config, lib, pkgs, inputs, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    enableReleaseChecks = false;
    autoEnable = true;

    # Image configs.
    image = ./../assets/wallpapers/tumblr-luminousslime-003.jpg;

    # Disable stylings for specific target apps.
    targets = {
      firefox.enable = false;
      wezterm.enable = true;
      gtk.enable = true;
    };
  };

  # Declare all 16 base16 colors as session variables to be used by applications
  # not controlled by Home Manager.
  home.sessionVariables = builtins.listToAttrs (
    builtins.genList (x: {
      name = "STYLIX_BASE_0${lib.toHexString x}";
      value = colors."base0${lib.toHexString x}";
    }) 15
  );

}
