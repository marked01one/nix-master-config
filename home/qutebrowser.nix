{ config, pkgs, ... }:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "/home/marked01one/Programming/nixos-config/dotfiles";
in {
  home.packages = with pkgs; [ unstable.qutebrowser ];
  programs.qutebrowser = {
    enable = true;
    package = pkgs.unstable.qutebrowser;
  };

  home.file = {
    ".config/qutebrowser" = {
      source = "${dotfiles}/qutebrowser";
      recursive = true;
    };
  };
}
