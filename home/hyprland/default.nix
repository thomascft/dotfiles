{inputs, config, lib, pkgs, ...}: {

  home.packages = [
    pkgs.rofi-wayland
    inputs.swww.packages.x86_64-linux.default
    pkgs.wlogout
    pkgs.swaylock-effects
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
  xdg.configFile = {
    "waybar/config".source = ./waybar/config;
	"swaylock/config".source = ./swaylock;
	"mako/config".source = ./mako;
  };
  programs.waybar = {
    enable = true;
    package = inputs.hyprland.packages.x86_64-linux.waybar-hyprland;
    # settings = [ builtins.readFile(./waybar/config) ];
    style = builtins.readFile(./waybar/style.css);
  };
  programs.mako = {
	enable = true;
  };
}
