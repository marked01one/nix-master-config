{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    gcc
    rustc
    rustup
  ];
}
