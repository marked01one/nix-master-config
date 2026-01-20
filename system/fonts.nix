{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.enable = true;
    # Enable emoji rendering on Firefox-based browsers.
    fontconfig.useEmbeddedBitmaps = true;
    fontconfig.defaultFonts = {
      serif = ["Noto Serif Light"];
      sansSerif = ["Noto Sans Light"];
      monospace = [
        "JetBrainsMono Nerd Font"
        "Noto Sans Mono CJK SC"
      ];
      emoji = ["Noto Color Emoji"];
    };
  };
}
