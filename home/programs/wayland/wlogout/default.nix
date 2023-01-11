{pkgs, lig, config, ...}:{
  home.packages = with pkgs; [
    wlogout
  ];
}
