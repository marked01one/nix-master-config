# For more troubleshooting tips, check out the NixOS wiki:
# https://wiki.nixos.org/wiki/Jellyfin

{ config, pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  # Enable hardware transcoding for Jellyfin instances running on Intel CPUs.
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      # Genertic OpenCL support.
      intel-ocl

      # For Broadwell and newer (ca. 2014+), use with LIBVA_DRIVER_NAME=iHD:
      intel-media-driver

      # For 13th gen and newer:
      intel-compute-runtime

      # For older processors:
      intel-compute-runtime-legacy1

      # For 11th gen and newer:
      vpl-gpu-rt
    ];

    # On Intel N100 CPUs, enable firmware loading to prevent GuC errors:
    hardware.enableAllFirmware = true;
  };
}
