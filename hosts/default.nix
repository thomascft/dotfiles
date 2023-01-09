{inputs, ...}:
let pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux; in {
  flake.nixosConfigurations = {
  acer = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {
	    networking.hostName = "acer";
		system.stateVersion = "22.05";
        boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
	  }
      ./acer/hardware-configuration.nix
	  ../modules/shared.nix
      ];
    };
  thonkpad = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {
	    networking.hostName = "thonkpad";
		system.stateVersion = "22.05";
        boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
	  }
	  ./thonkpad/hardware-configuration.nix
	  ../modules/shared.nix
      ];
    };

  };
}
