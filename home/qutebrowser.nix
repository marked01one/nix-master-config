{ config, pkgs, cwd, ... }:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in {
  home.packages = with pkgs; [ unstable.qutebrowser ];

  # Create a symlink for the qutebrowser dotfiles directory at:
  # `$HOME/.config/qutebrowser`
  home.file = {
    ".config/qutebrowser" = {
      source = "${dotfiles}/qutebrowser";
      recursive = true;
    };
  };
}
