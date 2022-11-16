{ nixpkgs, self, ... }: {
  acer = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "acer";}
	  ./configuration.nix
      ./acer/hardware-configuration.nix
    ];
    # specialArgs = {inherit inputs;};
  };
  thonkpad = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "thonkpad";}
	  ./configuration.nix
      ./thonkpad/hardware-configuration.nix
    ];
    # specialArgs = {inherit inputs;};
  };
}
