# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, system, ... }:
let
  kUseKDE = true;

  kSystem = "x86_64-linux";
  kUsername = "marked01one";
in {
  imports = [
    # System specific modifications.
    ./system/hardware.nix
    ./system/home-manager.nix
    ./system/nvidia.nix

    # General system configurations.
    ./../../system/niri.nix
    ./../../system/overlays.nix
    ./../../system/steam.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "strix-g18"; # Define your hostname.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable/disable the GNOME Desktop Environment.
  # services.displayManager.gdm.enable = !kUseKDE;
  # services.desktopManager.gnome.enable = !kUseKDE;

  # Enable/disable the KDE Desktop Environment
  services.displayManager.sddm = {
    enable = kUseKDE;
    wayland.enable = kUseKDE;
  };
  services.desktopManager.plasma6.enable = kUseKDE;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth and bluetooth services
  hardware = {
    bluetooth.enable = true;
  };
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

    # use the example session manager (no others are packaged yet so this is
    # enabled by default, no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marked01one = {
    isNormalUser = true;
    description = "marked01one";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      inputs.zen-browser.packages.${kSystem}.default
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

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = false;

  # Workaround for GNOME autologin
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Install firefox.
  programs.firefox.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      zstd
      stdenv.cc.cc
      curl
      openssl
      attr
      libssh
      bzip2
      libxml2
      acl
      libsodium
      util-linux
      xz
      systemd
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    zoom-us
    vscode
    discord
    youtube-music
    nvitop
    git
    steam
    prismlauncher

    unstable.rmpc

    wezterm
    ghostty

    qutebrowser

    # programming languages
    uv
    (pkgs.writeShellScriptBin "python" ''
      export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
      exec ${pkgs.python3}/bin/python "$@"
    '')
  ];

  environment.localBinInPath = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      serif = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Nunito" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Sans Mono CJK SC" ];
    };
  };

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
