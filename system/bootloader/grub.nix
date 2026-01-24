{...}: {
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    splashImage = ./../../assets/wallpapers/tumblr-fishbloc-001.jpg;
  };
}
