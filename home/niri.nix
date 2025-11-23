{ cwd, ... }:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in
{
  # Specify niri config directory.
  home.file = {
    ".config/niri" = {
      source = "${dotfiles}/niri";
      recursive = true;
    };
  };
}
