{pkgs, lig, config, ...}:{
  home.packages = with pkgs; [
    swaylock-effects
  ];
  xdg.configFile."swaylock/config".source = ./config;
}
