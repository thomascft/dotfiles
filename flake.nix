{
  description = "My NixOS Daily Driver";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    webcord.url = "github:fufexan/webcord-flake";

    swww.url = "github:thomascft/swww";
  };

  outputs = {self, nixpkgs, home-manager, hyprland, webcord, swww, ...} @ inputs: {
    nixosConfigurations = import ./hosts inputs;
	homeConfigurations.thomas = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
	    modules = [ 
	      ./home
	    ];
      };
  };
}
