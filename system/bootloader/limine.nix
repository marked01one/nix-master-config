{...}: {
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.limine = {
    enable = true;

    style = {
      wallpapers = [./../../assets/wallpapers/tumblr-fishbloc-001.jpg];
      wallpaperStyle = "stretched";

      interface = {
        branding = "Khoi's Digital Portal...";
        brandingColor = 7;
      };

      graphicalTerminal = {
        font = {
          spacing = 0;
          scale = "2x2";
        };

        # Using Catpuccin Frappe color scheme.
        palette = "303446;e78284;a6d189;e5c890;8caaee;f4b8e4;81c8be;c6d0f5";
        brightPalette = "626880;e78284;a6d189;e5c890;8caaee;f4b8e4;81c8be;c6d0f5";

        background = "99303446";
        foreground = "c6d0f5";

        margin = 10;
        marginGradient = 4;
      };
    };
  };
}
