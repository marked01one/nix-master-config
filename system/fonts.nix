{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      serif = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Nunito" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Sans Mono CJK SC" ];
    };
  };
}
