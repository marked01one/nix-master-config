{ config, pkgs, inputs, ... }:
let
  system = "x86_64-linux";
in {
  home.packages = with pkgs; [
    inputs.quickshell.packages.${system}.default
  ];
}
