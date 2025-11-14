{ config, pkgs, ... }:

{
  home.packages = [
    rmpc
    mpd
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";

    # Automatically update the MPD database when files change
    autoUpdate = true;

    # Configures MPD to output audio via PulseAudio
    audioOutputs = [
      {
        type = "pulse";
        name = "PulseAudio";
        server = "127.0.0.1";  # Use localhost
      }
    ];
  };
}
