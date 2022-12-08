{
  description = "My NixOS Daily Driver";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    hyprland.url = "github:hyprwm/Hyprland";

    # webcord.url = "github:fufexan/webcord-flake";

  };

  outputs = {self, nixpkgs, home-manager, hyprland, swww, ...} @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations = import ./hosts inputs;
	homeConfigurations.thomas = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
	    modules = [ 
	      ./home
	    ];
      };
    packages.x86_64-linux = {
      swww = pkgs.callPackage ./pkgs/swww.nix {};
    };
  };
}
