{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./shell
    ./hyprland
    ./editors/neovim
    ./wezterm
    ./fonts
    ./tools
    ./programs/brave
    ./programs/discord
    ./programs/signal
    ./programs/gimp
    ./programs/inkscape
	./programs/spotify
  ];
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home = {
    username = "thomas";
    homeDirectory = "/home/thomas";
    packages = [
      pkgs.playerctl
      pkgs.brightnessctl

      pkgs.grapejuice
      pkgs.steam
      pkgs.lutris
    ];
  };

  programs = {
    home-manager.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
