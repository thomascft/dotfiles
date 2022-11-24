{ config, lib, pkgs, ... }: {

  home.packages = [
    pkgs.gh
	(pkgs.discord.override { withOpenASAR = true; } )
  ];

  programs = {
	git = {
      enable = true;
      userName = "Thomas Croft";
      userEmail = "103956335+thomascft@users.noreply.github.com";
      lfs.enable = true;
    };

	chromium = {
	  enable = true;
      package = pkgs.brave;
	  extensions = [
	    "enpfonmmpgoinjpglildebkaphbhndek" # Tokyo Night Theme
	    "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
		"kekjfbackdeiabghhcdklcdoekaanoel" # MAL-Sync
		];
	};
  };
}
