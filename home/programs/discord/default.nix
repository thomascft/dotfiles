{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = [
    (pkgs.discord.override {withOpenASAR = true;})
  ];
}
