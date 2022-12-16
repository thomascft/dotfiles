{
  config,
  lib,
  pkgs,
  ...
}: {
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
	  extraConfig = {
	    credential = {
          "https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
          "https://gist.github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
		}; 
	  };
    };
  };
}
