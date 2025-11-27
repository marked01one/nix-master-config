{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    # Set up resource limits.
    daemon.settings = {
      dns = [ "1.1.1.1" "8.8.8.8" ];
      log-driver = "journald";
      registry-mirror = [ "https//mirror.gcr.io" ];
      storage-driver = "overlay2";
    };
    # Use rootless mode (i.e., run Docker daemon as non-root user).
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
