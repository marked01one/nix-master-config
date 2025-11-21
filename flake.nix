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
    # Niri flake input.
    niri = {
      url = "github:sodiboo/niri-flake";
      # Make sure niri uses the same nixpkgs as your system
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # Quickshell flake input.
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # Zen Browser flake input.
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = {
    self,
    home-manager,
    niri,
    nixpkgs,
    nixpkgs-unstable,
    quickshell,
    ...
  }@ inputs:

  let
    pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    cwd = builtins.getEnv "PWD";

    sharedOverlays = [
      (import ./overlays/unstable.nix inputs)
    ];
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
        specialArgs = {
          inherit inputs;
          inherit cwd;
        };
        modules = [
          # NixOS Flake inputs as modules
          home-manager.nixosModules.home-manager
          niri.nixosModules.niri
          { nixpkgs.overlays = sharedOverlays; }
          # Additional system-specific modules
          ./hosts/strix-g18/default.nix
        ];
      };
    };

    # Home Manager configurations for user-specific setups
    homeConfigurations = {
      "marked01one@strix-g18" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = sharedOverlays;
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
          inherit cwd;
        };  # { inputs = inputs; };
        modules = [ ./users/marked01one.nix ];
      };
    };

  };
}
