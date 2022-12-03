{ config, lib, pkgs, ... }: {

  home.packages = [
    pkgs.gh
	pkgs.xdg-utils
  ];

  programs = {
	git = {
      enable = true;
      userName = "Thomas Croft";
      userEmail = "103956335+thomascft@users.noreply.github.com";
      lfs.enable = true;
    };
  };
}
