{
  description = "Root flake for markedo1one's personal NixOS desktop";

  # Flake inputs
  inputs = {
    # Unstable (i.e., rolling release) channel
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Latest stable release (25.05) channel
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home Manager flake input
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Niri flake input.
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Quickshell flake input.
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Universal themeing framework for NixOS.
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Zen Browser flake input.
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    self,
    home-manager,
    niri,
    nixpkgs,
    nixpkgs-stable,
    quickshell,
    stylix,
    ...
  } @ inputs: let
    cwd = "/Programming/nixos-config";
    shared-overlays = [(import ./overlays/stable.nix inputs)];
  in {
    # NixOS System-wide configurations. To rebuild after change, run:
    # `nixos-rebuild switch --flake .#$(hostname)`
    nixosConfigurations = {
      # hostname: evo-x1 (to be used on EVO-X1 server)
      evo-x1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;}; # { inputs = inputs; };
        modules = [./hosts/evo-x1/default.nix];
      };
      # hostname: strix-g18 (to be used on ROG Strix G18 gaming laptop)
      strix-g18 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs cwd shared-overlays;};
        modules = [./hosts/strix-g18/default.nix];
      };
    };

    # Home Manager configurations for user-specific setups. To rebuild, run:
    # `home-manager switch --flake .#$(whoami)@$(hostname)`
    homeConfigurations = {
      "marked01one@strix-g18" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = shared-overlays;
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
          cwd = "/home/marked01one/${cwd}";
        };
        modules = [./users/marked01one.nix];
      };
    };
  };
}
