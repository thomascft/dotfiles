{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  home.packages = [
    pkgs.rofi-wayland
    pkgs.wlogout
    pkgs.swaylock-effects
    pkgs.wl-clipboard

    inputs.self.packages.x86_64-linux.swww

    pkgs.wayshot
    pkgs.slurp
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
  xdg.configFile = {
    "waybar/config".source = ./waybar/config.json;
	"waybar/assets" = {
	  source = ./waybar/assets;
	  recursive = true;
	};
    "swaylock/config".source = ./swaylock;
    "mako/config".source = ./mako;
  };
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
    style = builtins.readFile ./waybar/style.css;
  };
  programs.mako = {
    enable = true;
  };
}
