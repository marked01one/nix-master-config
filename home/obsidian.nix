# Note-taking app and text editor.
# Options: https://home-manager-options.extranix.com/?query=obsidian&release=master
{pkgs, ...}: {
  # Obsidian is classified as an `unfree` package.
  nixpkgs.config.allowUnfree = true;
  # General settings for Obsidian.
  programs.obsidian.enable = true;
  programs.obsidian.package = pkgs.obsidian;

  programs.obsidian = {
    defaultSettings = {
      corePlugins = [
        "backlink"
        "bookmarks"
        "canvas"
        "command-palette"
        "daily-notes"
        "editor-status"
        "file-explorer"
        "file-recovery"
        "global-search"
        "graph"
        "note-composer"
        "outgoing-link"
        "outline"
        "page-preview"
        "switcher"
        "tag-pane"
        "templates"
        "word-count"
      ];
    };

    vaults = {
      Notes = {
        enable = true;
        target = "/Documents/Obsidian/Notes";

        settings = {
          communityPlugins = [
            {
            }
          ];
        };
      };
      NixOS = {
        enable = true;
        target = "/Documents/Obsidian/NixOS";
      };
    };
  };
}
