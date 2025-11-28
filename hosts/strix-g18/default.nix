# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let
  hostname = "strix-g18";
  is-kde-used = true;

in {
  imports = [
    # Home manager flake input.
    inputs.home-manager.nixosModules.home-manager

    # System specific modifications.
    ./system/hardware.nix
    ./system/home-manager.nix
    ./system/nvidia.nix

    # General system configurations.
    ./../../system/default-packages.nix
    ./../../system/docker.nix
    ./../../system/neovim.nix
    ./../../system/nix-ld.nix
    ./../../system/python.nix
    ./../../system/sound.nix
    ./../../system/steam.nix
    ./../../system/zsh.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.dhcpcd.setHostname = false;
  networking.hostName = hostname;

  # Set your time zone.
  time.timeZone = "America/Vancouver";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # # Enable both X11 and Wayland windowing systems.
  # services.xserver.enable = true;
  # services.displayManager.sddm.wayland.enable = true;

  # # Enable/disable the KDE Desktop Environment
  # services.displayManager.sddm.enable = is-kde-used;
  # services.desktopManager.plasma6.enable = is-kde-used;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # As of 25.11
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  users.defaultUserShell = pkgs.zsh;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marked01one = {
    isNormalUser = true;
    description = "marked01one";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    discord
    legcord
  ];

  # Workaround for GNOME autologin
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "26.05";

  nix.settings = {
    allowed-users = [ "marked01one" ];
    experimental-features = [ "nix-command" "flakes" ];
  };
}
