{lib, ...}: {
  boot.loader.efi = {
    canTouchEfiVariables = false;
    efiSysMountPoint = "/boot";
  };

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    extraEntriesBeforeNixOS = true;
    efiInstallAsRemovable = true;
    device = "nodev";

    # Splash wallpaper for GRUB bootloader.
    splashImage = ./../../assets/wallpapers/tumblr-fishbloc-001.jpg;

    font = ./../../assets/fonts/nerdfont-jetbrainsmono.pf2;
    fontSize = 24;
  };

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.limine.enable = lib.mkForce false;
}
