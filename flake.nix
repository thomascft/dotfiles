{
  description = "My NixOS Daily Driver";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
	homeConfigurations = {
	  "thomas@acer" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./home
      ];
	  };
	  "thomas@thonkpad" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./home
      ];
	  };

    };
    nixosConfigurations = {
      modules = [
	    ./hosts/acer
	    ./hosts/thonkpad
	  ];
    };

    packages.x86_64-linux = {
      swww = pkgs.callPackage ./pkgs/swww.nix {};
    };
	formatter.x86_64-linux = pkgs.alejandra;
  };
}
