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

  home = {
    username = "thomas";
    homeDirectory = "/home/thomas";
    packages = [
      pkgs.wofi
      pkgs.wezterm
      pkgs.gh
      pkgs.playerctl

      inputs.swww.packages.x86_64-linux.swww

      (pkgs.nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono"]; } )
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
      # settings = [ builtins.readFile(./conf/waybar/config) ];
      style = builtins.readFile(./conf/waybar/style.css);
    };
    firefox.enable = true;
  };


  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
