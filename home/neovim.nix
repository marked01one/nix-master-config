{
  config,
  cwd,
  ...
}: let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in {
}
