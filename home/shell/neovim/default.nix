{ pkgs, ... }:
let 
  rootDir = ".config/neovim";
in 
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ":luafile ~/${rootDir}/init.lua"
  }

  home.file.${rootDir} = {
    source = ./config;
    recursive = true;
  }
}