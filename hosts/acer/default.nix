{inputs, pkgs, lib, config, ...}:{
  acer = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "acer";}
      ./hardware-configuration.nix
      ];
    };
}
