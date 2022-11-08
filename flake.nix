{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	# nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
	hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # specialArgs = { inherit inputs;};
        modules = [
          ./system/configuration.nix
        ];
      };
    homeConfigurations = {
      "thomas@nixos" = home-manager.lib.homeManagerConfiguration {
        #extraSpecialArgs = { inherit inputs;};
	pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ 
	./home.nix
        hyprland.homeManagerModules.default
        { wayland.windowManager.hyprland.enable = true; }
	];
      };
    };
  };
}
