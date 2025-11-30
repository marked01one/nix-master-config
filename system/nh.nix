{ config, pkgs, cwd, ... }:

{
  programs.nh = {
    enable = true;
    package = pkgs.nh;
    flake = "${cwd}";

    clean = {
      enable = true;
      extraArgs = "--keep 10 --keep-since 7d";
      dates = "monthly";
    };
  };
}
