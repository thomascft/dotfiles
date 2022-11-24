{ config, lib, pkgs, ... }: {
  xdg.configFile = {
    nvim = {
      source = ./conf;
      recursive = true;
    };
  };
  programs.neovim = {
    enable = true;
	extraPackages = [
	  pkgs.gcc # Needed for Treesitter
	];
  };
}
