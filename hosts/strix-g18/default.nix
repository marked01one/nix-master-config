# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  shared-overlays,
  ...
}: let
  hostname = "strix-g18";
  shell-scripts = import ./../../system/scripts.nix {inherit pkgs;};
in {
  # System imports.
  imports =
    (
      # System specific modifications.
      lib.mapAttrsToList (k: v: ./system + "/${k}") (builtins.readDir ./system)
    )
    ++ [
      # General system configurations.
      ./../../system/default-packages.nix
      ./../../system/docker.nix
      ./../../system/fonts.nix
      ./../../system/gnome.nix
      ./../../system/laptop.nix
      ./../../system/neovim.nix
      ./../../system/nh.nix
      ./../../system/nix-ld.nix
      ./../../system/sound.nix
      ./../../system/steam.nix
      ./../../system/zsh.nix
      ./../../system/ollama.nix

      # Programming languages
      ./../../system/java.nix
      ./../../system/python.nix
      ./../../system/rust.nix
    ];

  # Bootloader.
  strix-g18.bootloader.name = "grub";

  # Networking.
  networking.networkmanager.enable = true;
  networking.dhcpcd.setHostname = false;
  networking.hostName = hostname;

  # Set your time zone.
  time.timeZone = "America/Vancouver";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  users.defaultUserShell = pkgs.zsh;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marked01one = {
    isNormalUser = true;
    description = "marked01one";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = shared-overlays;

  # Add specific user-defined shell scripts.
  environment.systemPackages = with shell-scripts; [
    hello
    show-colors
    print-theme
    fcp
  ];

  system.stateVersion = "25.11";

  nix.settings = {
    allowed-users = ["marked01one"];
    experimental-features = ["nix-command" "flakes"];
  };
}
