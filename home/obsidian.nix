{pkgs, ...}: {
  # Obsidian is classified as an `unfree` package.
  nixpkgs.config.allowUnfree = true;
  # General settings for Obsidian.
  programs.obsidian.enable = true;
  programs.obsidian.package = pkgs.obsidian;

  programs.obsidian.defaultSettings = {
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
}
