{nixpkgs, ...}:{
  acer =   nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "acer";}
      ./hardware-configuration.nix
	  ./configuration.nix
      ];
    };
  thonkpad =   nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "thonkpad";}
	  ./thonkpad
	  ./configuration.nix
      ];
    };
}
