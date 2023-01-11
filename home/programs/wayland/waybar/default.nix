{pkgs, lib, config, ...}:{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
	systemd.enable = true;
  };
  xdg.configFile = {
    "waybar/config".source = ./config.json;
	"waybar/style.css".source = ./style.css;
	"waybar/assets" = {
	  source = ./assets;
	  recursive = true;
    };
  };
}
