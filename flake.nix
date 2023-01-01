{
  description = "My NixOS Daily Driver";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    flake-parts,
    nixpkgs,
    home-manager,
    hyprland,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
	    ./hosts
	  ];

      perSystem = {pkgs, ...}: {
        packages = {
          swww = pkgs.callPackage ./pkgs/swww.nix {};
        };
        formatter = pkgs.alejandra;
      };
      flake = {
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
      };
    };
}
