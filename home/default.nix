{inputs, ...}:{
  flake.homeConfigurations = {
          "thomas@acer" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {inherit inputs;};
            modules = [
              ./profiles/acer.nix
            ];
          };
          "thomas@thonkpad" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {inherit inputs;};
            modules = [
              ./profiles/thonkpad.nix
            ];
          };
        };
}
