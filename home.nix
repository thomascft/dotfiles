{inputs, lib, config, pkgs, ...}: {
  imports = [
  ];

  home = {
    username = "thomas";
    homeDirectory = "/home/thomas";
    packages = [
      pkgs.wofi
      pkgs.wezterm
      pkgs.gh
      pkgs.playerctl
    ];
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Thomas Croft";
      userEmail = "103956335+thomascft@users.noreply.github.com";
    };
    wezterm = {
      enable = true;
      extraConfig = builtins.readFile(./conf/wezterm/wezterm.lua);
    };
    waybar.enable = true;
    firefox.enable = true;
  };


  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
