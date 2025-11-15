# Home Manager System configuration
{ home-manager, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users = {
    marked01one = { imports = [ ./../../users/marked01one.nix ]; };
    # Add more users here if needed...
  };
}
