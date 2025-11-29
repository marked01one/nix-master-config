{ config, pkgs, cwd, ... }:

{
  programs.nh = {
    enable = true;
    package = pkgs.nh;
    flake = "${cwd}";

    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d";
      dates = "monthly";
    };
  };
}
