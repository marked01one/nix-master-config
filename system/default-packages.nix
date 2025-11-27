{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    git
    neovim
    wget
  ];
}
