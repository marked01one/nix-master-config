# Home Manager System configuration
{ inputs, config, pkgs, ... }:
let
in {
  # Import Home Manager input.
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  # Home Manager system configurations.
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.marked01one = {
      imports = [ ./../../../users/marked01one.nix ];
      # Add more users here if needed...
    };
  };
  # Add Home Manager to system packages.
  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
