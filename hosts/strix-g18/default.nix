# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  shared-overlays,
  ...
}:
let
  hostname = "strix-g18";
  shell-scripts = import ./../../system/scripts.nix { inherit pkgs; };

in {
  imports = [
    # System specific modifications.
    ./system/hardware.nix
    ./system/home-manager.nix
    ./system/nvidia.nix

    # General system configurations.
    ./../../system/default-packages.nix
    ./../../system/docker.nix
    ./../../system/gnome.nix
    ./../../system/neovim.nix
    ./../../system/nh.nix
    ./../../system/nix-ld.nix
    ./../../system/python.nix
    ./../../system/sound.nix
    ./../../system/steam.nix
    ./../../system/zsh.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = shared-overlays;

  environment.systemPackages = with shell-scripts; [
    hello
  ];

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

  system.stateVersion = "25.11";

  nix.settings = {
    allowed-users = [ "marked01one" ];
    experimental-features = [ "nix-command" "flakes" ];
  };
}
