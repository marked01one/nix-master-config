{ config, pkgs, cwd, ... }:

{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    # See https://github.com/fastfetch-cli/fastfetch/wiki/Json-Schema
    settings = {
      logo = {
        source = "${cwd}/assets/fastfetch/sasaki-and-miyano.png";
      };
      modules = [
        "break"
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "de"
        "wm"
        "icons"
        "cpu"
        "gpu"
        "memory"
        "battery"
        "break"
        "colors"
      ];
    };
  };
}
