{pkgs, ...}: {
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    defaultFonts = {
      serif = ["Noto Serif Light"];
      sansSerif = ["Noto Sans Light"];
      monospace = [
        "JetBrainsMono Nerd Font"
        "Noto Sans Mono CJK SC"
      ];
    };
  };

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
  ];
}
