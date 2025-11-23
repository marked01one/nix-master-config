{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.unstable.firefox;
    languagePacks = [ "en-US" "en-GB" "vi-VN" ];

    # Policy settings for Firefox. For a full list, see here:
    # https://mozilla.github.io/policy-templates/
    policies = {
      BlockAboutConfig = true;
      DefaultDownloadDirectory = "${config.home.homeDirectory}/Downloads";
      DisableTelemetry = true;

      # Extensions
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        # Block downloads of all undeclared extensions by default.
        "*".installation_mode = "blocked";

        # UBlock Origin
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          private_browsing = true;
          updates_disabled = true;
        };
      };
    };
  };

}
