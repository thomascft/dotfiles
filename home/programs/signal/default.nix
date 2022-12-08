{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    signal-desktop
  ];
}
