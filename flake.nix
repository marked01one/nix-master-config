{
  description = "Root flake for markedo1one's personal NixOS desktop";

  # Flake inputs
  inputs = {
    # Unstable (i.e., rolling release) channel
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Latest stable release (25.05) channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home Manager flake input
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # Nix flake input for niri
    niri = {
      url = "github:sodiboo/niri-flake";
      # Make sure niri uses the same nixpkgs as your system
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # Niri flake
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # Zen Browser flake input
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, niri, ... }@ inputs:

  let
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
  in
  {

    nixosConfigurations = {
      # hostname: evo-x1 (to be used on EVO-X1 server)
      evo-x1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };  # { inputs = inputs; };
        modules = [ ./hosts/evo-x1/system.nix ];
      };
      # hostname: strix-g18 (to be used on ROG Strix G18 gaming laptop)
      strix-g18 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };  # { inputs = inputs; };
        modules = [
          # NixOS Flake inputs as modules
          home-manager.nixosModules.home-manager
          niri.nixosModules.niri

          # Additional system-specific modules
          ./hosts/strix-g18/default.nix
        ];
      };
    };

    # Home Manager configurations for user-specific setups
    homeConfigurations = {
      "marked01one@strix-g18" = home-manager.lib.homeManagerConfigurations {
        inherit pkgs;  # pkgs = pkgs;
        extraSpecialArgs = { inherit inputs; };  # { inputs = inputs; };
        modules = [ ./users/marked01one.nix ];
      };
    };

  };
}
