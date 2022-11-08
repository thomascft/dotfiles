{inputs, lib, config, pkgs, ...}: {
  imports = [
  ];

  home = {
    username = "thomas";
    homeDirectory = "/home/thomas";
    packages = [
      pkgs.wofi
      pkgs.wezterm
    ];
  };

  xdg.configFile."hypr/hyprland.conf".source = ./conf/hyprland.conf;
  programs = {
    home-manager.enable = true;
    git.enable = true;
    wezterm.enable = true;
    waybar.enable = true;
    firefox.enable = true;
  };


  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
