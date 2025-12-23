{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      serif = ["Noto Serif Light"];
      sansSerif = ["Noto Sans Light"];
      monospace = [
        "JetBrainsMono Nerd Font"
        "Noto Sans Mono CJK SC"
      ];
    };
  };
}
