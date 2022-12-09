{inputs, pkgs, lib, config, ...}:{
  homeConfigurations."thomas@thonkpad" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ../../home
      ];
    };
  nixosConfigurations.thonkpad = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "thonkpad";}
      ./hardware-configuration.nix
    ];
    # specialArgs = {inherit inputs;};
  };
}
