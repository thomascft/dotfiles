{inputs, pkgs, lib, config, ...}:{
  imports = [
    ./hardware-configuration.nix
	../../modules/libvirtd.nix
  ];
}
