# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let
  system = "x86_64-linux";
  hostname = "strix-g18";
  is-kde-used = true;

in {
  imports = [
    # System specific modifications.
    ./system/hardware.nix
    ./system/home-manager.nix
    ./system/nvidia.nix

    # General system configurations.
    ./../../system/fonts.nix
    ./../../system/niri.nix
    ./../../system/python.nix
    ./../../system/steam.nix
    ./../../system/zsh.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.dhcpcd.setHostname = false;

  # Set your time zone.
  time.timeZone = "America/Vancouver";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable both X11 and Wayland windowing systems.
  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Enable/disable the KDE Desktop Environment
  services.displayManager.sddm.enable = is-kde-used;
  services.desktopManager.plasma6.enable = is-kde-used;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth and bluetooth services
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    systemWide = false;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marked01one = {
    isNormalUser = true;
    description = "marked01one";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      inputs.zen-browser.packages.${system}.default
      unstable.spotdl
      obsidian
      btop
      pandoc
      drawio
      teams-for-linux
      kew
      atuin
    ];
  };

  # Workaround for GNOME autologin
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    discord
    git
    neovim
    nvitop
    prismlauncher
    vscode
    wget
    youtube-music
    zoom-us
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

  system.stateVersion = "25.05";

  nix.settings = {
    allowed-users = [ "marked01one" ];
    experimental-features = [ "nix-command" "flakes" ];
  };
}
