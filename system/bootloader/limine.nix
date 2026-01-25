{...}: {
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.limine = {
    enable = true;

    style = {
      wallpapers = [./../../assets/wallpapers/tumblr-fishbloc-001.jpg];

      graphicalTerminal = {
        font = {
          spacing = 0;
          scale = "2x2";
        };
      };
    };
  };
}
