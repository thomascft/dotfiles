{pkgs, lib, config, ...}:{
  programs.mako.enable = true;
  xdg.configFile."mako/config".source = ./config;
}
