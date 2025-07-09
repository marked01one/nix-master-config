{
  description = "Root flake for markedo1one's personal NixOS desktop";


  nixConfig = {

  }

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs: 
  
  let 
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
  in   
  {
    # hostname: nixos
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };  # 
      modules = [ ./system/default.nix ]; 
    };

    homeConfigurations = {
      "marked01one@nixos" = home-manager.lib.homeManagerConfigurations {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs };
        modules = [ ./home/default.nix ];
      }
    };

  };
}
