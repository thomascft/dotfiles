{inputs, pkgs, lib, config, ...}:{
  homeConfigurations."thomas@acer" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ../../home
		../../home/programs/cura/
      ];
    };
  nixosConfigurations.acer = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "acer";}
      ./hardware-configuration.nix
    ];
  };
}
