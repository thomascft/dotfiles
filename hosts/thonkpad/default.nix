{inputs, pkgs, lib, config, ...}:{
  thonkpad = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "thonkpad";}
      ./hardware-configuration.nix
      ];
    };
}
}
