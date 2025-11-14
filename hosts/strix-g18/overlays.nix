# Define NixOS overlays for unstable packages
{ config, pkgs, inputs, system, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # Define an alias overlay for unstable packages
  nixpkgs.overlays = [
     (final: prev: {
      unstable = import inputs.nixpkgs-unstable {
	      system = final.system;
	      config.allowUnfree = true;
      };
    })
  ];
}
