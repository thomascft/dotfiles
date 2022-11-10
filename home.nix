{inputs, lib, config, pkgs, ...}: {
  imports = [
    inputs.hyprland.homeManagerModules.default { 
	wayland.windowManager.hyprland = {
	enable = true;
	extraConfig = builtins.readFile ./conf/hyprland.conf;
      };
    }
    inputs.webcord.homeManagerModules.default {
        programs.webcord.enable = true;
    }
  ];

  nixpkgs.config = {
  allowUnfree = true;
  allowUnfreePredicate = (_: true);
  };

  home = {
    username = "thomas";
    homeDirectory = "/home/thomas";
    packages = [
      inputs.swww.packages.x86_64-linux.default
      pkgs.rofi-wayland
      pkgs.wezterm
      pkgs.wlogout
      pkgs.swaylock-effects

      pkgs.gh

      pkgs.playerctl
      pkgs.spotify
      pkgs.brightnessctl

      pkgs.grapejuice
      pkgs.steam
      pkgs.lutris


      pkgs.iosevka
      (pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; } )
    ];
  };

  

  xdg.configFile = {
    "waybar/config".source = ./conf/waybar/config;
  };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Thomas Croft";
      userEmail = "103956335+thomascft@users.noreply.github.com";
      lfs.enable = true;
    };
    wezterm = {
      enable = true;
      extraConfig = builtins.readFile(./conf/wezterm/wezterm.lua);
    };
    waybar = {
      enable = true;
      package = inputs.hyprland.packages.x86_64-linux.waybar-hyprland;
      # settings = [ builtins.readFile(./conf/waybar/config) ];
      style = builtins.readFile(./conf/waybar/style.css);
    };
    firefox.enable = true;
  };


  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
