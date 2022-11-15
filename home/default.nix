{inputs, lib, config, pkgs, ...}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.webcord.homeManagerModules.default {
        programs.webcord.enable = true;
    }
	./shell
	./hyprland
	./neovim
	./wezterm
	./fonts
	./tools
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  home = {
    username = "thomas";
    homeDirectory = "/home/thomas";
    packages = [


      pkgs.playerctl
      pkgs.spotify
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
