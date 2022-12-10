{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
	../swww
	../waybar
	../mako
	../swaylock
	../wlogout
	../wofi
  ];

  home.packages = [
    pkgs.rofi-wayland
    pkgs.wl-clipboard
    pkgs.wayshot
    pkgs.slurp
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
