# Home Manager System configuration
{
  cwd,
  inputs,
  pkgs,
  ...
}: {
  # Import Home Manager input.
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  # Home Manager system configurations.
  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      cwd = "/home/marked01one/${cwd}";
    };
    users.marked01one = {
      imports = [./../../../users/marked01one.nix];
      # Add more users here if needed...
    };
  };
  # Add Home Manager to system packages.
  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
