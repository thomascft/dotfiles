{inputs, ...}:{
  flake.nixosConfigurations = {
acer = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {
	    networking.hostName = "acer";
		system.stateVersion = "22.05";
	  }
      ./acer
	  ../modules/shared.nix
      ];
    };
  thonkpad = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {
	    networking.hostName = "thonkpad";
		system.stateVersion = "22.05";
	  }
	  ./thonkpad
	  ../modules/shared.nix
      ];
    };

  };
  }
