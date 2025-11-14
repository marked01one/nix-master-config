# Dedicated Nvidia graphics configuration
# For more details: https://wiki.nixos.org/wiki/NVIDIA
{ config, lib, pkgs, modulesPath, ... }:

{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
  hardware.nvidia.open = true;

  # Enable hybrid graphics with PRIME
  hardware.nvidia.prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true;

    # Check the PCI bus ID of each GPU using this command:
    # `nix shell nixpkgs#pciutils -c lspci -d ::03xx`
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
