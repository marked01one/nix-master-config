{
  pkgs,
  lib,
  ...
}: {
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";

    # Splash wallpaper for GRUB bootloader.
    splashImage = ./../../assets/wallpapers/tumblr-raqkuni-001.jpg;

    font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNLNerdFont-Regular.ttf";
    fontSize = 16;
  };

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.limine.enable = lib.mkForce false;
}
