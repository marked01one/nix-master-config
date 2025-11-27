{ config, pkgs, cwd, ... }:

{
  programs.nh = {
    enable = true;
    flake = "${cwd}";
    clean = {
      enable = true;
      
    };
  };
}
