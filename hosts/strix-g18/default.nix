# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  shared-overlays,
  ...
}: let
  hostname = "strix-g18";
  shell-scripts = import ./../../system/scripts.nix {inherit pkgs;};
in {
  # System imports.
  imports = [
    # System specific modifications.
    ./system/hardware.nix
    ./system/home-manager.nix
    ./system/nvidia.nix

    # General system configurations.
    ./../../system/default-packages.nix
    ./../../system/docker.nix
    ./../../system/fonts.nix
    ./../../system/gnome.nix
    ./../../system/laptop.nix
    ./../../system/neovim.nix
    ./../../system/nh.nix
    ./../../system/nix-ld.nix
    ./../../system/python.nix
    ./../../system/rust.nix
    ./../../system/sound.nix
    ./../../system/steam.nix
    ./../../system/zsh.nix
  ];

  # Bootloader.
  boot.loader = {
    limine.enable = true;
    efi.canTouchEfiVariables = true;
  };

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

  # Periodic storage optimizations.
  nix.optimise.automatic = true;
  nix.optimise.dates = ["03:45"];

  # Garbage collection.
  nix.gc =
    if !pkgs.stdenv.isDarwin
    then {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    }
    else {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 14d";
    };

  system.stateVersion = "25.11";

  nix.settings = {
    allowed-users = ["marked01one"];
    experimental-features = ["nix-command" "flakes"];
  };
}
