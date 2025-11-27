{ config, pkgs, ... }:

{
  program.nh = {
    enable = true;
    package = pkgs.nh;
  };
}
