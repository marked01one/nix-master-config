{pkgs, ...}: {
  # As of 25.11
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages =
    (
      with pkgs; [
        gnome-photos
        gnome-tour
        gnome-user-docs
        gnome-text-editor
        gnome-weather
        gnome-calendar
        gnome-calculator
        gnome-console
        gnome-maps
      ]
    )
    ++ (
      with pkgs; [
        cheese # webcam tool
        gnome-music
        gedit # text editor
        epiphany # web browser
        geary
        gnome-characters
        tali
        iagno
        hitori
        atomix
        yelp
        gnome-contacts
        gnome-initial-setup
      ]
    );

  # Enable dconf for gnome configuration.
  programs.dconf.enable = true;

  # Workaround for GNOME autologin
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
