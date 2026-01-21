{
  config,
  pkgs,
  cwd,
  ...
}: let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in {
  home.packages = [(pkgs.qutebrowser.override {enableVulkan = false;})];

  # Create a symlink for the qutebrowser dotfiles directory at:
  # `$HOME/.config/qutebrowser`
  home.file = {
    ".config/qutebrowser" = {
      source = "${dotfiles}/qutebrowser";
      recursive = true;
    };
  };
}
