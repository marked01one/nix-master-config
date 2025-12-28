{
  config,
  pkgs,
  cwd,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    languagePacks = ["en-US" "en-GB" "vi-VN"];

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
        "*" = {
          blocked_install_message = ''
            All Firefox extensions are blocked from download via the Firefox UI.
            To add extensions, open and edit: `${cwd}/homes/firefox.nix`
          '';
          installation_mode = "blocked";
          "allowed_types" = ["extension"];
        };

        # UBlock Origin.
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          private_browsing = true;
          updates_disabled = true;
        };

        # AO3 Enhancements.
        "ao3-enhancements@jsmnbom" = {
          default_area = "menupanel";
          install_url = moz "ao3-enhancements";
          installation_mode = "normal_installed";
          private_browsing = true;
          updates_disabled = false;
        };

        # Return YouTube Dislikes.
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          default_area = "menupanel";
          install_url = moz "return-youtube-dislikes";
          installation_mode = "normal_installed";
          private_browsing = true;
          updates_disabled = false;
        };
      };
    };
  };
}
