{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.rmpc
    mpd
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    # Configures MPD to output audio via PulseAudio
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };
}
