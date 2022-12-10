{pkgs, lib, config, ...}:{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
  };
  xdg.configFile.waybar = {
	source = ./conf;
	recursive = true;
  };
}
