{
  description = "My NixOS Daily Driver";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, hyprland, ...}@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	  system = "x86_64-linux";
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
	  specialArgs = { inherit inputs; };
	  modules = [
	    ./configuration.nix
	  ];
	};
    homeConfigurations = {
      "thomas@nixos"= home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
	modules = [ 
          hyprland.homeManagerModules.default
	  { 
	    wayland.windowManager.hyprland = {
	      enable = true;
	      extraConfig = builtins.readFile ./conf/hyprland.conf;
	    };
	  }
	  ./home.nix
	];
      };
    };
  };
}
