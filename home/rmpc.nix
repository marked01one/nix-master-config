{
  config,
  pkgs,
  cwd,
  ...
}: let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${cwd}/dotfiles";
in {
  home.packages = with pkgs; [
    rmpc
    mpd
    cava
  ];

  home.file = {
    ".config/rmpc" = {
      source = "${dotfiles}/rmpc";
      recursive = true;
    };
  };

  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    # Configures MPD to output audio via PulseAudio
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }

      audio_output {
        type "fifo"
        name "rmpc fifo for cava"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
      }
    '';
  };
}
