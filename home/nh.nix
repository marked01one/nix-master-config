{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nh
  ];

  program.nh = {
    enable = true;
    package = pkgs.nh;
  };
}
