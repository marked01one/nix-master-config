{ config, pkgs, cwd, ... }:
let 
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in 
{

}
